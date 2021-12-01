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
        max_distance:   ((Mineshift.virtual_screen_width/2)*SIZES[0]).to_i * 10,
        max_blocks:     4,
        block_size:     ((Mineshift.virtual_screen_width/2)*SIZES[0]).to_i,
        deviation:      4,
        window_padding: 0.4,
      },

      1 => {
        max_distance:   ((Mineshift.virtual_screen_width/2)*SIZES[1]).to_i * 12,
        max_blocks:     3,
        block_size:     ((Mineshift.virtual_screen_width/2)*SIZES[1]).to_i,
        deviation:      2,
        window_padding: 0.3,
      },

      2 => {
        max_distance:   ((Mineshift.virtual_screen_width/2)*SIZES[2]).to_i * 16,
        max_blocks:     3,
        block_size:     ((Mineshift.virtual_screen_width/2)*SIZES[2]).to_i,
        deviation:      3,
        window_padding: 0.25,
      },

      3 => {
        max_distance:   ((Mineshift.virtual_screen_width/2)*SIZES[3]).to_i * 20,
        max_blocks:     7,
        block_size:     ((Mineshift.virtual_screen_width/2)*SIZES[3]).to_i,
        deviation:      2,
        window_padding: 0.2,
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

    WINDOW           =  0.224673_f32
    WINDOW_TYPE      = 0.3652563_f32
    WINDOW_SUBDIVIDE =  0.381922_f32

    CIRCLE_WINDOW_TYPE = 0.002372_f32
    CIRCLE_WINDOW_STRUT_PARTS_NUMBER = 0.20302_f32
    CIRCLE_WINDOW_STRUT_PARTS = 0.20302_f32
    SQUARE_WINDOW_TYPE =  0.26261_f32
  end

  module Windows
    CHANCE = 1 
    OUT_OF = 3

    CIRCLE_TYPES = [:plain, :center, :strut]
    CIRCLE_MIN_PARTS = 4
    CIRCLE_MAX_PARTS = 5


    ALL    = [
      # Square window
      ->(layer : UInt8, x : Float32, y : Float32, w : Float32, h : Float32) {
        padding = w * Layer::DATA[layer][:window_padding]

        Rl.draw_rectangle(x + padding, y + padding, w - (padding * 2), h - (padding * 2), Rl::BLACK)

        if Mineshift.perlin.prng_int(x.to_i, y.to_i, 0, 3, Seeds::SQUARE_WINDOW_TYPE).zero?
          center_square_w = w / (4.0 + (1.0 - (layer/Layer::MAX)))

          center_square_x = x + w / 2.0 - (center_square_w) / 2.0
          center_square_y = y + h / 2.0 - (center_square_w) / 2.0
          Rl.draw_rectangle(center_square_x, center_square_y, center_square_w, center_square_w, Rl::WHITE)
        end

        # Rl.draw_rectangle_lines(x, y, w, h, Rl::MAGENTA)

      },

      # Circle window
      ->(layer : UInt8, x : Float32, y : Float32, w : Float32, h : Float32) {
        padding = w * Layer::DATA[layer][:window_padding]

        Rl.draw_circle(x + w / 2.0, y + h / 2.0, (w/2.0) - padding, Rl::BLACK)

        type = Mineshift.perlin.prng_item(x.to_i, y.to_i, CIRCLE_TYPES, Seeds::CIRCLE_WINDOW_TYPE)
        window_color = Rl::WHITE
        thickness = layer * 2

        if type == :center
          Rl.draw_circle(x + w / 2.0, y + h / 2.0, (w/3.0) - padding, window_color)
        elsif type == :strut
          parts = [
            ->(x : Float32, y : Float32, r : Float32) {
              Rl.draw_line_ex(Rl::Vector2.new(x: x, y: y), Rl::Vector2.new(x: x + r, y: y), thickness, window_color)
            },

            ->(x : Float32, y : Float32, r : Float32) {
              Rl.draw_line_ex(Rl::Vector2.new(x: x, y: y), Rl::Vector2.new(x: x - r, y: y), thickness, window_color)
            },

            ->(x : Float32, y : Float32, r : Float32) {
              Rl.draw_line_ex(Rl::Vector2.new(x: x, y: y), Rl::Vector2.new(x: x, y: y + r), thickness, window_color)
            },
            
            ->(x : Float32, y : Float32, r : Float32) {
              Rl.draw_line_ex(Rl::Vector2.new(x: x, y: y), Rl::Vector2.new(x: x, y: y - r), thickness, window_color)
            },

            ->(x : Float32, y : Float32, r : Float32) {
              Rl.draw_circle(x, y, r*0.4*((layer+1) / (Layer::MAX+1)), window_color)
            },
          ] of Proc(Float32, Float32, Float32, Nil)

          number_of_parts = Mineshift.perlin.prng_int(x.to_i, y.to_i, Windows::CIRCLE_MIN_PARTS.to_i, Windows::CIRCLE_MAX_PARTS.to_i + 1, Seeds::CIRCLE_WINDOW_STRUT_PARTS_NUMBER)

          number_of_parts.times do |z|
            part_index = Mineshift.perlin.prng_int(x.to_i, y.to_i, z, 0, parts.size, Seeds::CIRCLE_WINDOW_STRUT_PARTS)

            parts[part_index].call(x + w / 2.0, y + h / 2.0, (w / 2.0).to_f32)
            parts.delete_at(part_index)

          end
        end

        # Rl.draw_rectangle_lines(x, y, w, h, Rl::MAGENTA)

      },

    ] of Proc(UInt8, Float32, Float32, Float32, Float32, Nil)
  end

  class_getter textures = StaticArray(Rl::Texture2D, Layer::MAX).new { Rl::Texture2D.new }

  class_getter camera = Rl::Camera2D.new

  class_property upscale_ratio = 1.0
  class_property virtual_screen_width : Int32 = (1280/upscale_ratio).to_i
  class_property virtual_screen_height : Int32 = (1024/upscale_ratio).to_i
  class_property screen_ratio = 1.0_f32
  class_property height_multiplier = 8

  class_property? show_seed = false

  class_getter perlin = PerlinNoise.new(1_000_000)
  @@color_palette : Array(Rl::Color) = colors[0]
  @@axis_movement = 0.0_f32

  def self.setup(seed = 1_000_000)
    destroy

    # zero out old stuff
    @@textures = StaticArray(Rl::Texture2D, Layer::MAX).new { Rl::Texture2D.new }
    @@camera = Rl::Camera2D.new
    @@camera.zoom = 1.0_f32
    @@axis_movement = 0.0_f32

    @@perlin = PerlinNoise.new(seed)

    @@color_palette = @@perlin.item(0, colors, Seeds::COLOR)
    render_layers
  end

  private def self.virtual_screen_ratio
    virtual_screen_width/virtual_screen_height
  end

  private def self.screen_width
    virtual_screen_width * upscale_ratio
  end

  private def self.screen_height
    virtual_screen_height * upscale_ratio
  end

  private def self.layer_height_blocks(layer)
    ((@@virtual_screen_height * @@height_multiplier)/Layer::DATA[layer][:block_size]).floor
  end

  private def self.layer_height(layer)
    (layer_height_blocks(layer) * Layer::DATA[layer][:block_size]).floor - 1
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
    center = (@@virtual_screen_width/2).to_i
    current_height = 0
    # Perlin counter (provides random values by increasing seed)
    p_counter = 1

    until current_height > layer_height(layer)
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

        while left_top_point.x > 0 && left_top_point.x < @@virtual_screen_width &&
              left_top_point.y > 0 && left_top_point.y < layer_height(layer) &&
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
              while right_top_point.x > 0 && right_top_point.x < @@virtual_screen_width &&
                    right_top_point.y > 0 && right_top_point.y < (layer_height(layer)) &&
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
    bridge_bounding_boxes
  end

  private def self.make_beams(layer, chasm_rects)
    beam_bounding_boxes = [] of Rl::Rectangle
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

          min_thickness = (3/upscale_ratio).ceil.to_i - (layer == 2 ? 1 : 0)
          beam_height_ratio = beam_height / max_beam_height

          thickness = @@perlin.prng_int(layer, rect_index, min_thickness, min_thickness + 1 + (min_thickness * beam_height_ratio).to_i, Seeds::BEAM_THICKNESS)

          # Check if the beam properly intersects all points of the chasm rectangle, and ensure the beam isn't too long.
          if [left_top, right_top, left_bot, right_bot].all? { |v| Rl.check_collision_point_rec?(v, rect) } && ((right_bot.x - left_bot.x)/rect.width < MAX_BEAM_RATIO)
            if beam_short_side == :top
              if beam_side == :left
                beam_bounding_boxes << Rl::Rectangle.new(x: left_top.x, y: left_top.y, width: right_top.x - left_top.x, height: left_bot.y - left_top.y)
              elsif beam_side == :right
                beam_bounding_boxes << Rl::Rectangle.new(x: left_top.x, y: left_top.y, width: right_top.x - left_top.x, height: left_bot.y - left_top.y)
              end
            elsif beam_short_side == :bottom
              if beam_side == :left
                beam_bounding_boxes << Rl::Rectangle.new(x: left_top.x, y: left_top.y, width: right_bot.x - left_top.x, height: left_bot.y - left_top.y)
              elsif beam_side == :right
                beam_bounding_boxes << Rl::Rectangle.new(x: left_bot.x, y: left_top.y, width: right_bot.x - left_bot.x, height: left_bot.y - left_top.y)
              end
            end
            # Draw the outline
            Rl.draw_line_ex(left_top, right_top, thickness, Rl::WHITE)
            Rl.draw_line_ex(right_bot, right_top, thickness, Rl::WHITE)
            Rl.draw_line_ex(left_bot, right_bot, thickness, Rl::WHITE)
            Rl.draw_line_ex(left_top, left_bot, thickness, Rl::WHITE)

            # Fix the line caps (they are straight, we need circles)
            Rl.draw_circle_v(left_top, thickness/2, Rl::WHITE)
            Rl.draw_circle_v(right_top, thickness/2, Rl::WHITE)
            Rl.draw_circle_v(right_bot, thickness/2, Rl::WHITE)
            Rl.draw_circle_v(left_bot, thickness/2, Rl::WHITE)

            # Rl.draw_rectangle_lines_ex(beam_bounding_boxes.last, 1, Rl::MAGENTA)

            # Draw the struts
            # true: draw stroke from top to bottom, false: draw stroke from bottom to top
            mirror = true
            current_point = Rl::Vector2.new

            # Set up the point and mirroring where it needs to be.
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

            # Walk the struct lines
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
    beam_bounding_boxes
  end

  private def self.make_windows(layer, chasm_rects)
    window_bounding_boxes = [] of Rl::Rectangle
    window_ratio = 2.0
    max_windpw_frame = Rl::Rectangle.new(
      x: 0,
      y: 0,
      width: Layer::DATA[layer][:block_size] * window_ratio,
      height: Layer::DATA[layer][:block_size] * window_ratio
    )

    if layer > 0
      chasm_rects.each_with_index do |rect, rect_index|
        left_rect = Rl::Rectangle.new(
          x: 0,
          y: rect.y,
          width: rect.x, # 0 => x
          height: rect.height
        )

        right_rect = Rl::Rectangle.new(
          x: rect.x + rect.width,
          y: rect.y,
          width: virtual_screen_width - (rect.x + rect.width),
          height: rect.height
        )

        subdivided_squares = [] of Rl::Rectangle

        current_x = 0
        while (current_x + left_rect.height) < left_rect.width
          subdivided_squares << Rl::Rectangle.new(
            x: current_x,
            y: left_rect.y,
            width: left_rect.height,
            height: left_rect.height
          )

          current_x += left_rect.height
        end

        current_x = virtual_screen_width
        until (current_x - right_rect.height) < right_rect.x
          subdivided_squares << Rl::Rectangle.new(
            x: current_x - right_rect.height,
            y: right_rect.y,
            width: right_rect.height,
            height: right_rect.height
          )

          current_x -= right_rect.height
        end

        subdivided_squares = subdivided_squares.map do |square|
          if @@perlin.prng_int(square.x.to_i, square.y.to_i, rect_index, 2, 3, Seeds::WINDOW_SUBDIVIDE).zero?
            width = square.width/2.0

            [
              Rl::Rectangle.new(
                x: square.x,
                y: square.y,
                width: width,
                height: width
              ),

              Rl::Rectangle.new(
                x: square.x + width,
                y: square.y,
                width: width,
                height: width
              ),

              Rl::Rectangle.new(
                x: square.x + width,
                y: square.y + width,
                width: width,
                height: width
              ),

              Rl::Rectangle.new(
                x: square.x,
                y: square.y + width,
                width: width,
                height: width
              ),
            ]
          else
            square
          end
        end.flatten

        subdivided_squares.each_with_index do |rect, rect_index|
          if @@perlin.int(rect.x.to_i + (layer * 10), rect.y.to_i, Windows::CHANCE - 1, Windows::OUT_OF, Seeds::WINDOW) <= (Windows::CHANCE - 1)
            @@perlin.prng_item(rect.x.to_i + (layer * 10), rect.y.to_i, rect_index, Windows::ALL, Seeds::WINDOW_TYPE).call layer, rect.x, rect.y, rect.width, rect.height
            window_bounding_boxes << rect
          end
        end
      end
    end

    window_bounding_boxes
  end

  def self.render_layers
    Layer::MAX.to_u8.times { |x| render_layer x }
  end

  def self.render_layer(layer : UInt8)
    raise "Invalid layer #{layer}" unless layer < Layer::MAX

    # We will render to this texture for the layer
    render_texture = Rl.load_render_texture(@@virtual_screen_width, layer_height(layer))

    Rl.begin_texture_mode(render_texture)
    Rl.clear_background(Rl::WHITE)
    Rl.begin_mode_2d(@@camera)

    chasm_rects = make_chasm_rects(layer)

    # Draw the center chasm mask
    chasm_rects.each do |rect|
      Rl.draw_rectangle_rec(rect, Rl::BLACK)
    end

    bridge_rects = make_bridges(layer, chasm_rects)
    beam_rects = make_beams(layer, chasm_rects)

    window_rects = make_windows(layer, chasm_rects)

    Rl.end_mode_2d
    Rl.end_texture_mode

    # Make an image out of our render texture
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

    @@axis_movement += Rl.get_gamepad_axis_movement(0, Rl::GamepadAxis::LeftY)

    Layer::MAX.times do |x|
      layer_offset = (666 * x) + 10.0/upscale_ratio + ((5.0 / upscale_ratio) * ((x + 1) ** x) * (@@axis_movement * 0.05))
      Rl.draw_texture_pro(
        @@textures[x],
        Rl::Rectangle.new(x: 0.0_f32, y: -layer_offset, width: @@virtual_screen_width, height: -@@virtual_screen_height),
        Rl::Rectangle.new(x: 0, y: 0, width: screen_width, height: screen_height),
        Rl::Vector2.new,
        0.0_f32,
        Rl::WHITE
      )
    end

    if show_seed?
      text_size = 20
      text_length = Rl.measure_text(perlin.seed.to_s, text_size)

      x = (screen_width / 2.0) - (text_length/2.0)
      y = (screen_height * 0.9)
      w = text_length + (text_size)
      h = text_size + (text_size)

      Rl.draw_rectangle(x - (text_size/2.0), y - (text_size/2.0), w, h, Rl::WHITE)
      Rl.draw_rectangle_lines(x - (text_size/2.0), y - (text_size/2.0), w, h, Rl::BLACK)
      Rl.draw_text(perlin.seed.to_s, x, y, text_size, Rl::BLACK)
    end
    Rl.end_mode_2d
    Rl.end_drawing
  end

  def self.draw_loading
    Rl.begin_drawing
    Rl.clear_background(Rl::RAYWHITE)
    Rl.begin_mode_2d(@@camera)

    loading_text = "Loading..."
    text_size = 20
    text_measure = Rl.measure_text(loading_text, text_size)

    Rl.draw_text(loading_text, (screen_width/2.0) - (text_measure/2.0), (screen_height/2.0) - (text_measure/2.0), text_size, Rl::BLACK)

    Rl.end_mode_2d
    Rl.end_drawing
  end

  def self.destroy
    @@textures.each { |t| Rl.unload_texture t }
  end

  def self.run(seed = 1_000_000)
    Rl.init_window(screen_width, screen_height, "Mineshift(#{seed})")
    Rl.set_target_fps(60)

    Mineshift.draw_loading
    Mineshift.setup(seed)

    until Rl.close_window?
      Mineshift.draw
      if Rl.key_pressed?(Rl::KeyboardKey::Space) || Rl.gamepad_button_pressed?(0, 7)
        seed = rand(1_000_000)
        Mineshift.draw_loading

        Mineshift.setup(seed)
        Rl.set_window_title("Mineshift(#{seed})")
      end

      if Rl.key_pressed?(Rl::KeyboardKey::Right) || Rl.gamepad_button_pressed?(0, 11)
        seed &+= 1
        Mineshift.draw_loading

        Mineshift.setup(seed)
        Rl.set_window_title("Mineshift(#{seed})")
      end

      if Rl.key_pressed?(Rl::KeyboardKey::Left) || Rl.gamepad_button_pressed?(0, 9)
        seed &-= 1
        Mineshift.draw_loading

        Mineshift.setup(seed)
        Rl.set_window_title("Mineshift(#{seed})")
      end

      if Rl.key_pressed?(Rl::KeyboardKey::Q) || (Rl.get_gamepad_axis_movement(0, 5) > 0.5)
        Mineshift.show_seed = true
      else
        Mineshift.show_seed = false
      end
    end

    Mineshift.destroy

    Rl.close_window
  end
end

Mineshift.run(rand(1_000_000))
