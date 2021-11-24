require "raylib-cr"
require "perlin_noise"

require "./colors"

alias Rl = LibRaylib

module Mineshift
  DEBUG = true

  MIN_BEAM_RATIO = 0.1
  MAX_BEAM_RATIO = 0.5

  module Layer
    MAX   = 4
    SIZES = {
      0 => 0.02,
      1 => 0.04,
      2 => 0.06,
      3 => 0.08,
    }

    DATA = {
      0 => {
        max_distance: ((Mineshift.screen_width/2)*SIZES[0]).to_i * 10,
        max_blocks:   4,
        block_size:   ((Mineshift.screen_width/2)*SIZES[0]).to_i,
        deviation:    4,
      },

      1 => {
        max_distance: ((Mineshift.screen_width/2)*SIZES[1]).to_i * 12,
        max_blocks:   3,
        block_size:   ((Mineshift.screen_width/2)*SIZES[1]).to_i,
        deviation:    2,
      },

      2 => {
        max_distance: ((Mineshift.screen_width/2)*SIZES[2]).to_i * 16,
        max_blocks:   3,
        block_size:   ((Mineshift.screen_width/2)*SIZES[2]).to_i,
        deviation:    3,
      },

      3 => {
        max_distance: ((Mineshift.screen_width/2)*SIZES[3]).to_i * 20,
        max_blocks:   7,
        block_size:   ((Mineshift.screen_width/2)*SIZES[3]).to_i,
        deviation:    2,
      },
    }
  end

  module Seeds
    COLOR                 = 0.111123_f32
    BLOCK_SPACING         = 0.283673_f32
    CENTER_MASK_DEVIATION = 0.834728_f32
    BRIDGE_HEIGHT         =  0.83772_f32
    BRIDGE_ANGLE          =  0.34134_f32

    BEAM            =   0.66262_f32
    BEAM_SIDE       =   0.76792_f32
    BEAM_HEIGHT     =  0.111728_f32
    BEAM_LENGTH     =  0.872653_f32
    BEAM_SEGMENTS   =  0.225632_f32
    BEAM_SHORT_SIDE = 0.5727312_f32
    BEAM_THICKNESS  =  0.612617_f32
  end

  class_getter textures = StaticArray(Rl::Texture2D, Layer::MAX).new { Rl::Texture2D.new }

  class_getter camera = Rl::Camera2D.new

  class_property screen_width = 1000
  class_property screen_height = 600
  class_property screen_ratio = 1.0_f32
  class_property height_multiplier = 4

  @@perlin = PerlinNoise.new(1_000_000)
  @@color_palette : Array(Rl::Color) = colors[0]

  def self.setup(seed = 1_000_000)
    destroy

    # zero out old stuff
    @@textures = StaticArray(Rl::Texture2D, Layer::MAX).new { Rl::Texture2D.new }
    @@camera = Rl::Camera2D.new
    @@camera.zoom = 1.0_f32

    @@perlin = PerlinNoise.new(seed)

    @@color_palette = @@perlin.item(0, colors, Seeds::COLOR)
    render_layers
  end

  private def self.rotate_point(x, y, ox, oy, deg) : Rl::Vector2
    angle = deg * (::Math::PI/180)
    rx = ::Math.cos(angle) * (x - ox) - ::Math.sin(angle) * (y - oy) + ox
    ry = ::Math.sin(angle) * (x - ox) + ::Math.cos(angle) * (y - oy) + oy
    Rl::Vector2.new(x: rx, y: ry)
  end

  # Makes the center chasm mask for a layer.
  private def self.make_chasm_rects(layer : UInt8)
    raise "Invalid layer #{layer}" unless layer < Layer::MAX

    # zero out layer
    output = [] of Rl::Rectangle
    center = (@@screen_width/2).to_i
    current_height = 0
    # Perlin counter (provides random values by increasing seed)
    p_counter = 1

    until current_height > (@@screen_height * @@height_multiplier)
      mask_rect = Rl::Rectangle.new

      additional_block_spacing = @@perlin.prng_int(
        p_counter,
        current_height,
        layer + 1,
        0,
        Layer::DATA[layer][:max_blocks],
        Seeds::BLOCK_SPACING) * Layer::DATA[layer][:block_size]
      mask_rect.width = Layer::DATA[layer][:max_distance] - additional_block_spacing
      mask_rect.height = Layer::DATA[layer][:block_size] + 1 # Offset by one because of svg antialiasing issues

      position_x = center - (mask_rect.width/2).to_i
      deviation =
        @@perlin.int(
          current_height,
          p_counter,
          layer + 1,
          -Layer::DATA[layer][:deviation],
          Layer::DATA[layer][:deviation],
          Seeds::CENTER_MASK_DEVIATION
        )

      deviation *= Layer::DATA[layer][:block_size]
      mask_rect.y = current_height - 1 # Offset by one to ensure overlap
      mask_rect.x = position_x - deviation
      current_height += Layer::DATA[layer][:block_size]
      p_counter += 1

      output << mask_rect
    end
    output
  end

  private def self.make_bridges(layer, chasm_rects)
    bridge_bounding_boxes = [] of Rl::Rectangle
    bridge_paths = [] of Array(Rl::Vector2)
    if layer < 2
      chasm_rects.each_with_index do |rect, rect_index|
        mask_center_point = Rl::Vector2.new(x: rect.x + rect.width/2.0_f32, y: rect.y + rect.height/2.0_f32)
        bridge_angle = @@perlin.prng_int(layer, rect_index, -30, 30, Seeds::BRIDGE_ANGLE)
        bridge_height = @@perlin.prng_int(layer, rect_index, (Layer::DATA[layer][:block_size]*0.20).to_i, (Layer::DATA[layer][:block_size]*0.75).to_i, Seeds::BRIDGE_HEIGHT)

        # Top point above the center of the bridge
        bridge_center_top_point = Rl::Vector2.new(x: mask_center_point.x, y: (mask_center_point.y - bridge_height/2.0_f32))
        # Bottom point above the center of the bridge
        bridge_center_bottom_point = Rl::Vector2.new(x: mask_center_point.x, y: (mask_center_point.y + bridge_height/2.0_f32))

        bridge_collision_seg_size = Layer::DATA[layer][:block_size]*0.08

        bridge_ray = rotate_point(bridge_collision_seg_size, 0, 0, 0, bridge_angle)
        left_top_point = bridge_center_top_point

        while left_top_point.x > 0 && left_top_point.x < @@screen_width &&
              left_top_point.y > 0 && left_top_point.y < (@@screen_height * @@height_multiplier) &&
              chasm_rects.any? { |cr| Rl.check_collision_point_rec?(left_top_point, cr) }
          left_top_point = Rl::Vector2.new(
            x: (left_top_point.x - bridge_ray.x),
            y: (left_top_point.y - bridge_ray.y),
          )

          if !chasm_rects.any? { |cr| Rl.check_collision_point_rec?(left_top_point, cr) }
            left_bot_point = Rl::Vector2.new(
              x: left_top_point.x,
              y: (left_top_point.y + bridge_height),
            )

            if !chasm_rects.any? { |cr| Rl.check_collision_point_rec?(left_bot_point, cr) }
              right_top_point = bridge_center_top_point
              while right_top_point.x > 0 && right_top_point.x < @@screen_width &&
                    right_top_point.y > 0 && right_top_point.y < (@@screen_height * @@height_multiplier) &&
                    chasm_rects.any? { |cr| Rl.check_collision_point_rec?(right_top_point, cr) }
                right_top_point = Rl::Vector2.new(
                  x: (right_top_point.x + bridge_ray.x),
                  y: (right_top_point.y + bridge_ray.y),
                )
              end
              if !chasm_rects.any? { |cr| Rl.check_collision_point_rec?(right_top_point, cr) }
                right_bot_point = Rl::Vector2.new(
                  x: right_top_point.x,
                  y: (right_top_point.y + bridge_height),
                )

                if !chasm_rects.any? { |cr| Rl.check_collision_point_rec?(right_bot_point, cr) }
                  bb = Rl::Rectangle.new
                  if left_top_point.y < right_top_point.y
                    bb.x = left_top_point.x.to_i
                    bb.y = left_top_point.y.to_i
                    bb.width = (right_top_point.x - left_top_point.x).to_i
                    bb.height = (right_bot_point.y - left_top_point.y).to_i
                  else
                    bb.x = left_top_point.x.to_i
                    bb.y = right_top_point.y.to_i
                    bb.width = (right_top_point.x - left_top_point.x).to_i
                    bb.height = (left_bot_point.y - right_top_point.y).to_i
                  end

                  if bridge_bounding_boxes.empty? || !bridge_bounding_boxes.any? { |b_bb| Rl.check_collision_recs?(bb, b_bb) }
                    bridge_bounding_boxes << bb

                    Rl.draw_triangle(left_top_point, left_bot_point, right_bot_point, Rl::WHITE)
                    Rl.draw_triangle(left_top_point, right_bot_point, right_top_point, Rl::WHITE)
                  end
                end
              end
            end
          end
        end
      end
    end
  end

  private def self.make_beams(layer, chasm_rects)
    bridge_bounding_boxes = [] of Rl::Rectangle
    bridge_paths = [] of Array(Rl::Vector2)
    if layer > 1
      chasm_rects.each_with_index do |rect, rect_index|
        if @@perlin.prng_int(layer, rect_index, 0, 5, Seeds::BEAM) == 0
          beam_side = @@perlin.prng_item(layer, rect_index, [true, false], Seeds::BEAM_SIDE) ? :left : :right
          beam_point = Rl::Vector2.new
          if beam_side == :left
            beam_point.x = rect.x
            beam_point.y = rect.y + rect.height/2.0
          elsif beam_side == :right
            beam_point.x = rect.x + rect.width
            beam_point.y = rect.y + rect.height/2.0
          end

          min_beam_height = (Layer::DATA[layer][:block_size]*0.20).to_i
          max_beam_height = (Layer::DATA[layer][:block_size]*0.70).to_i
          beam_height = @@perlin.prng_int(layer, rect_index, min_beam_height, max_beam_height, Seeds::BEAM_HEIGHT)

          min_segments = ((rect.width*MIN_BEAM_RATIO/beam_height)).to_i
          max_segments = ((rect.width*MAX_BEAM_RATIO/beam_height)).to_i
          segments = @@perlin.prng_int(layer.to_i, rect_index, min_beam_height, max_beam_height, Seeds::BEAM_SEGMENTS)

          beam_short_side = @@perlin.prng_item(layer, rect_index, [true, false], Seeds::BEAM_SHORT_SIDE) ? :top : :bottom

          beam_point.y -= beam_height/2.0

          left_top = Rl::Vector2.new
          right_top = Rl::Vector2.new
          left_bot = Rl::Vector2.new
          right_bot = Rl::Vector2.new

          # beam_side = :right
          # beam_short_side = :bottom

          if beam_short_side == :top
            if beam_side == :left
              left_top = beam_point
              right_top = Rl::Vector2.new(x: beam_point.x + (beam_height * segments), y: beam_point.y)
              left_bot = Rl::Vector2.new(x: beam_point.x, y: beam_point.y + beam_height)
              right_bot = Rl::Vector2.new(x: beam_point.x + (beam_height * (segments - 1)), y: beam_point.y + beam_height)
            elsif beam_side == :right
              left_top = Rl::Vector2.new(x: beam_point.x - (beam_height * segments), y: beam_point.y)
              right_top = beam_point
              left_bot = Rl::Vector2.new(x: beam_point.x - (beam_height * (segments - 1)), y: beam_point.y + beam_height)
              right_bot = Rl::Vector2.new(x: beam_point.x, y: beam_point.y + beam_height)
            end
          elsif beam_short_side == :bottom
            if beam_side == :left
              left_top = beam_point
              right_top = Rl::Vector2.new(x: beam_point.x + (beam_height * (segments - 1)), y: beam_point.y)
              left_bot = Rl::Vector2.new(x: beam_point.x, y: beam_point.y + beam_height)
              right_bot = Rl::Vector2.new(x: beam_point.x + (beam_height * segments), y: beam_point.y + beam_height)
            elsif beam_side == :right
              left_top = Rl::Vector2.new(x: beam_point.x - (beam_height * (segments - 1)), y: beam_point.y)
              right_top = beam_point
              left_bot = Rl::Vector2.new(x: beam_point.x - (beam_height * segments), y: beam_point.y + beam_height)
              right_bot = Rl::Vector2.new(x: beam_point.x, y: beam_point.y + beam_height)
            end
          end

          min_thickness = 3
          beam_height_ratio = beam_height / max_beam_height

          thickness = @@perlin.prng_int(layer, rect_index, min_thickness, min_thickness + 1 + (min_thickness * beam_height_ratio).to_i, Seeds::BEAM_THICKNESS)

          # TODO: Figure out this bug with beam length, theoretically this should never happen.
          # Bug: Sometimes the beam clips out of the rectangle, even though it should be limited by min/max segment rules.
          # don't draw if the beam is clipping out of the rectangle or if it's more than 50% of the width of the rectangle
          if [left_top, right_top, left_bot, right_bot].all? { |v| Rl.check_collision_point_rec?(v, rect) } && ((right_bot.x - left_bot.x)/rect.width < 0.5)
            Rl.draw_line_ex(left_top, right_top, thickness, Rl::WHITE)
            Rl.draw_line_ex(right_bot, right_top, thickness, Rl::WHITE)
            Rl.draw_line_ex(left_bot, right_bot, thickness, Rl::WHITE)
            Rl.draw_line_ex(left_top, left_bot, thickness, Rl::WHITE)

            Rl.draw_circle_v(left_top, thickness/2, Rl::WHITE)
            Rl.draw_circle_v(right_top, thickness/2, Rl::WHITE)
            Rl.draw_circle_v(right_bot, thickness/2, Rl::WHITE)
            Rl.draw_circle_v(left_bot, thickness/2, Rl::WHITE)

            # true: draw stroke from top to bottom, false: draw stroke from bottom to top
            mirror = true
            current_point = Rl::Vector2.new

            if beam_short_side == :top
              if beam_side == :left
                current_point = right_top
              elsif beam_side == :right
                current_point = left_top
              end
            elsif beam_short_side == :bottom
              mirror = false # draw bottom to top
              if beam_side == :left
                current_point = right_bot
              elsif beam_side == :right
                current_point = left_bot
              end
            end

            segments.times do 
              if mirror
                if beam_side == :left
                  new_point = Rl::Vector2.new(x: current_point.x - beam_height, y: current_point.y + beam_height)
                  Rl.draw_line_ex(current_point, new_point, thickness, Rl::WHITE)
                  current_point = new_point
                elsif beam_side == :right
                  new_point = Rl::Vector2.new(x: current_point.x + beam_height, y: current_point.y + beam_height)
                  Rl.draw_line_ex(current_point, new_point, thickness, Rl::WHITE)
                  current_point = new_point
                end
              else
                if beam_side == :left
                  new_point = Rl::Vector2.new(x: current_point.x - beam_height, y: current_point.y - beam_height)
                  Rl.draw_line_ex(current_point, new_point, thickness, Rl::WHITE)
                  current_point = new_point
                elsif beam_side == :right
                  new_point = Rl::Vector2.new(x: current_point.x + beam_height, y: current_point.y - beam_height)
                  Rl.draw_line_ex(current_point, new_point, thickness, Rl::WHITE)
                  current_point = new_point
                end
              end

              mirror = !mirror
            end
          end
        end
      end
    end
  end

  def self.render_layers
    Layer::MAX.to_u8.times { |x| render_layer x }
  end

  def self.render_layer(layer : UInt8)
    raise "Invalid layer #{layer}" unless layer < Layer::MAX

    # We will render to this texture for the layer
    render_texture = Rl.load_render_texture(@@screen_width, @@screen_height * @@height_multiplier)

    Rl.begin_texture_mode(render_texture)
    Rl.clear_background(Rl::WHITE)
    Rl.begin_mode_2d(@@camera)

    chasm_rects = make_chasm_rects(layer)

    # Draw the center chasm mask
    chasm_rects.each do |rect|
      Rl.draw_rectangle_rec(rect, Rl::BLACK)
    end

    make_bridges(layer, chasm_rects)
    make_beams(layer, chasm_rects)

    Rl.end_mode_2d
    Rl.end_texture_mode

    # Make an image
    image = Rl.load_image_from_texture(render_texture.texture)

    # Replace the color black with transparency
    Rl.image_color_replace(pointerof(image), Rl::BLACK, Rl::Color.new(r: 0_u8, g: 0_u8, b: 0_u8, a: 0_u8))
    # Replace white with the color of the layer
    Rl.image_color_replace(pointerof(image), Rl::WHITE, @@color_palette[layer + 1])
    # Reload the texture from the image
    @@textures[layer] = Rl.load_texture_from_image(image)

    # Clean up the old data
    Rl.unload_image(image)
    Rl.unload_render_texture(render_texture)
  end

  def self.draw
    Rl.begin_drawing
    Rl.clear_background(@@color_palette[0])
    Rl.begin_mode_2d(@@camera)

    offset =
      Layer::MAX.times do |x|
        layer_offset = -20 * (x + 1) * Rl.get_time
        Rl.draw_texture_pro(
          @@textures[x],
          Rl::Rectangle.new(x: 0.0_f32, y: layer_offset + @@textures[x].height - @@screen_height, width: @@screen_width, height: -@@screen_height),
          Rl::Rectangle.new(x: 0, y: 0, width: @@screen_width, height: @@screen_height),
          Rl::Vector2.new,
          0.0_f32,
          Rl::WHITE
        )
      end
    Rl.end_mode_2d
    Rl.end_drawing
  end

  def self.destroy
    @@textures.each { |t| Rl.unload_texture t }
  end

  def self.run(seed = 1_000_000)
    Rl.init_window(@@screen_width, @@screen_height, "Mineshift(#{seed})")
    Rl.set_target_fps(60)

    Mineshift.setup(seed)

    until Rl.close_window?
      Mineshift.draw
      if Rl.key_pressed?(Rl::KeyboardKey::Space) || Rl.gamepad_button_pressed?(0, 7)
        seed = rand(1_000_000)
        Mineshift.setup(seed)
        Rl.set_window_title("Mineshift(#{seed})")
      end
    end

    Mineshift.destroy

    Rl.close_window
  end
end

Mineshift.run(rand(1_000_000))
