require "raylib-cr"
require "perlin_noise"

require "./colors"

alias Rl = LibRaylib

module Mineshift
  # TODO: Actually implement this lol!
  # Debug mode on or off
  DEBUG = true

  module Beam
    # Minimum ratio of block size to beam height
    MIN_RATIO = 0.1
    # Maximum ratio of block size to beam height
    MAX_RATIO = 0.5
  end

  # Layer data and information.
  module Layer
    # How many max layers
    MAX = 4
    # Scaling constants for each layer
    SIZES = {
      0 => 0.02,
      1 => 0.04,
      2 => 0.06,
      3 => 0.08,
    }

    # The layer data including max distance, max blocks, block size, deviation, and how much the window's should be padded.
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

  # Each of the unique seeds made to prevent value tying.
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

    CIRCLE_WINDOW_TYPE               = 0.002372_f32
    CIRCLE_WINDOW_STRUT_PARTS_NUMBER =  0.20302_f32
    CIRCLE_WINDOW_STRUT_PARTS        =  0.20302_f32
    SQUARE_WINDOW_TYPE               =  0.26261_f32
  end

  # Window information
  module Windows
    # Chance to spawn a window
    CHANCE = 1
    # Chance to spawn a window out of how many total?
    OUT_OF = 3

    # What types the circle window can have
    CIRCLE_TYPES = [:plain, :center, :strut]
    # Minimum circle parts for :strut
    CIRCLE_MIN_PARTS = 4
    # Maximum circle parts for :strut
    CIRCLE_MAX_PARTS = 5

    # All the windows made into procs that take a x, y, w, h value and fits the window in that rectangle.
    ALL = [
      # Square window
      ->(layer : UInt8, x : Float32, y : Float32, w : Float32, h : Float32) {
        padding = w * Layer::DATA[layer][:window_padding]

        Rl.draw_rectangle(x + padding, y + padding, w - (padding*2), h - (padding*2), Rl::BLACK)

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
        thickness = w * 0.1

        if type == :center
          Rl.draw_circle(x + w / 2.0, y + h / 2.0, (w/3.0) - padding, window_color)
        elsif type == :strut && layer != 1
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
              Rl.draw_circle(x, y, r*0.4*((layer + 1) / (Layer::MAX + 1)), window_color)
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

  # The textures used by each layer
  class_getter textures = StaticArray(Rl::Texture2D, Layer::MAX).new { Rl::Texture2D.new }

  # The 2D camera
  class_getter camera = Rl::Camera2D.new

  # How much should we upscale/downscale the image
  class_property scale_ratio = 1.0
  # The virtual screen width
  class_property virtual_screen_width : Int32 = (1280/scale_ratio).to_i
  # The virtual screen height
  class_property virtual_screen_height : Int32 = (1024/scale_ratio).to_i
  # How many `virtual_screen_height`s high we should make the final texture. If set to `1.0` it will only reapeat one screen's worth of content.
  class_property height_multiplier = 8
  # Should we show the seed number in a tasteful little white box?
  class_property? show_seed = false

  # Our RNGesus
  class_getter perlin = PerlinNoise.new(1_000_000)

  # WHat color pallette we are using
  @@color_palette : Array(Rl::Color) = colors[0]
  # How much the y axis should be scrolled by. Changed by moving the analog stick or pressing up or down.
  @@axis_movement = 0.0_f32

  def self.setup(seed = 1_000_000)
    # destroy any old textures.
    destroy

    # zero out old stuff
    @@textures = StaticArray(Rl::Texture2D, Layer::MAX).new { Rl::Texture2D.new }
    @@camera = Rl::Camera2D.new
    @@camera.zoom = 1.0_f32
    @@axis_movement = 0.0_f32

    @@perlin = PerlinNoise.new(seed)

    # Choose a color palette
    @@color_palette = @@perlin.item(0, colors, Seeds::COLOR)
    render_layers
  end

  # The ratio of `virtual_screen_width` to `virtual_screen_height`
  private def self.virtual_screen_ratio
    virtual_screen_width/virtual_screen_height
  end

  # Actual window width
  private def self.screen_width
    virtual_screen_width * scale_ratio
  end

  # Actual window height
  private def self.screen_height
    virtual_screen_height * scale_ratio
  end

  # The height of the texture for a layer in blocks. Prevents "seams" bug
  private def self.layer_height_blocks(layer)
    ((@@virtual_screen_height * @@height_multiplier)/Layer::DATA[layer][:block_size]).floor
  end

  # The height of the texture for a layer. Prevents "seams" bug
  private def self.layer_height(layer)
    (layer_height_blocks(layer) * Layer::DATA[layer][:block_size]).floor - 1
  end

  # Rotates a point around another point
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

  # Makes bridges on layers 0 and 1
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

  # Make metal beams on layers 2 and 3.
  private def self.make_beams(layer, chasm_rects)
    # Bounding boxes of the beams, used for collision detection later.
    beam_bounding_boxes = [] of Rl::Rectangle

    # Only draw on layers 2 and 3
    if layer > 1
      # Go through each potential beam location
      chasm_rects.each_with_index do |rect, rect_index|
        # Should we draw a beam here?
        if @@perlin.prng_int(layer, rect_index, 0, 5, Seeds::BEAM) == 0
          # How should the beam be positioned? Left or right?
          beam_side = @@perlin.prng_item(layer, rect_index, [true, false], Seeds::BEAM_SIDE) ? :left : :right

          # Determine the starting point for the beam.
          beam_point = Rl::Vector2.new
          if beam_side == :left
            beam_point.x = rect.x
            beam_point.y = rect.y + rect.height/2.0
          elsif beam_side == :right
            beam_point.x = rect.x + rect.width
            beam_point.y = rect.y + rect.height/2.0
          end

          # Beam height parameters and choose a beam height.
          min_beam_height = (Layer::DATA[layer][:block_size]*0.20).to_i
          max_beam_height = (Layer::DATA[layer][:block_size]*0.70).to_i
          beam_height = @@perlin.prng_int(layer, rect_index, min_beam_height, max_beam_height, Seeds::BEAM_HEIGHT)

          # Number of segments a beam should have.
          min_segments = ((rect.width*Beam::MIN_RATIO/beam_height)).to_i
          max_segments = ((rect.width*Beam::MAX_RATIO/beam_height)).to_i
          segments = @@perlin.prng_int(layer.to_i, rect_index, min_beam_height, max_beam_height, Seeds::BEAM_SEGMENTS)

          # Should the top or bottom be short?
          beam_short_side = @@perlin.prng_item(layer, rect_index, [true, false], Seeds::BEAM_SHORT_SIDE) ? :top : :bottom

          # The beam point is directly in the middle, so offset it up to where it should be
          beam_point.y -= beam_height/2.0

          # Figure out the points for the beam
          left_top = Rl::Vector2.new
          right_top = Rl::Vector2.new
          left_bot = Rl::Vector2.new
          right_bot = Rl::Vector2.new

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

          # Minimum line thickness for the beam
          min_thickness = (3/scale_ratio).ceil.to_i - (layer == 2 ? 1 : 0)
          beam_height_ratio = beam_height / max_beam_height

          # Choose a line thickness
          thickness = @@perlin.prng_int(layer, rect_index, min_thickness, min_thickness + 1 + (min_thickness * beam_height_ratio).to_i, Seeds::BEAM_THICKNESS)

          # Check if the beam properly intersects all points of the chasm rectangle, and ensure the beam isn't too long.
          if [left_top, right_top, left_bot, right_bot].all? { |v| Rl.check_collision_point_rec?(v, rect) } && ((right_bot.x - left_bot.x)/rect.width < Beam::MAX_RATIO)
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
    # Unmeltable by any jet fuel.
    beam_bounding_boxes
  end

  # Draw the windows on layers 1, 2, and 3
  private def self.make_windows(layer, chasm_rects)
    window_bounding_boxes = [] of Rl::Rectangle
    window_ratio = 2.0

    # Largest possible window
    max_window_frame = Rl::Rectangle.new(
      x: 0,
      y: 0,
      width: Layer::DATA[layer][:block_size] * window_ratio,
      height: Layer::DATA[layer][:block_size] * window_ratio
    )

    if layer > 0
      subdivided_squares = [] of Rl::Rectangle

      frame_rect = max_window_frame
      until (frame_rect.y + frame_rect.height) >= layer_height(layer)
        frame_rect.x = 0
        # Check if frame_rects collide,
        until chasm_rects.any? { |r| Rl.check_collision_recs?(frame_rect, r) }
          raise "Something went wrong, frame_rect should collide before this happens" if frame_rect.x > virtual_screen_width
          subdivided_squares << frame_rect
          frame_rect.x += frame_rect.width
        end

        frame_rect.y += frame_rect.height
      end

      frame_rect = max_window_frame
      until (frame_rect.y + frame_rect.height) >= layer_height(layer)
        frame_rect.x = virtual_screen_height - frame_rect.width
        # Check if frame_rects collide,
        until chasm_rects.any? { |r| Rl.check_collision_recs?(frame_rect, r) }
          raise "Something went wrong, frame_rect should collide before this happens" if frame_rect.x < 0
          subdivided_squares << frame_rect
          frame_rect.x -= frame_rect.width
        end

        frame_rect.y += frame_rect.height
      end

      passes = 1
      passes = 2 if layer == 3

      if layer > 0
        passes.times do |pass|
          subdivided_squares = subdivided_squares.map do |square|
            if @@perlin.prng_int(square.x.to_i, square.y.to_i, (pass+1) * (layer+1), 0, 10, Seeds::WINDOW_SUBDIVIDE) < 7
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
        end
      end

      subdivided_squares.each_with_index do |rect, rect_index|
        if @@perlin.int(rect.x.to_i, rect.y.to_i, ((layer&+1) &* rect_index), Windows::CHANCE - 1, Windows::OUT_OF, Seeds::WINDOW) <= (Windows::CHANCE - 1)
          @@perlin.prng_item(rect.x.to_i, rect.y.to_i, ((layer&+1) &* rect_index), Windows::ALL, Seeds::WINDOW_TYPE).call layer, rect.x, rect.y, rect.width, rect.height
          window_bounding_boxes << rect
        end
      end
    end

    window_bounding_boxes
  end

  # Render all the layer's textures
  def self.render_layers
    Layer::MAX.to_u8.times do |x| 
      draw_loading(0.2_f32 * (x+1), "Drawing Layer #{x}")
      render_layer x 
    end
  end

  # Render a particular layer's texture
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

  # Draw the scene
  def self.draw
    Rl.begin_drawing
    Rl.clear_background(@@color_palette[0])
    Rl.begin_mode_2d(@@camera)

    # Draw each layer
    Layer::MAX.times do |x|
      # Offset it because for some reason there is "perlin striping" showing similarities in the different  layers
      layer_offset = (666 * x) + 10.0/scale_ratio + ((5.0 / scale_ratio) * ((x + 1) ** x) * (@@axis_movement * 0.05))

      # Draw the texture so when scrolling it will move the y of the source rect, causing the texture to repeat.
      Rl.draw_texture_pro(
        @@textures[x],
        Rl::Rectangle.new(x: 0.0_f32, y: -layer_offset, width: @@virtual_screen_width, height: -@@virtual_screen_height),
        Rl::Rectangle.new(x: 0, y: 0, width: screen_width, height: screen_height),
        Rl::Vector2.new,
        0.0_f32,
        Rl::WHITE
      )
    end

    # Show the seed if the variable is true
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

  # TODO: Find out why this doesn't work after init window.....
  # Draw a loading screen.
  def self.draw_loading(percent_done : Float32, text_displayed : String)
    Rl.begin_drawing
    Rl.clear_background(Rl::RAYWHITE)
    Rl.begin_mode_2d(@@camera)

    loading_text = "Loading..."
    text_size = 20
    loading_text_measure = Rl.measure_text(loading_text, text_size)

    Rl.draw_text(loading_text, (screen_width/2.0) - (loading_text_measure/2.0), (screen_height/2.0) - (loading_text_measure/2.0), text_size, Rl::BLACK)
    Rl.draw_rectangle_lines((screen_width/2.0) - (loading_text_measure/2.0), (screen_height/2.0) - (loading_text_measure/2.0) + text_size, loading_text_measure, text_size*2, Rl::BLACK)
    Rl.draw_rectangle((screen_width/2.0) - (loading_text_measure/2.0), (screen_height/2.0) - (loading_text_measure/2.0) + text_size, (loading_text_measure * percent_done), text_size*2, Rl::BLACK)

    text_measure = Rl.measure_text(text_displayed, text_size-2)
    Rl.draw_text(text_displayed, (screen_width/2.0) - (text_measure/2.0), (screen_height/2.0) - (text_measure/2.0), text_size-2, Rl::BLACK)


    Rl.end_mode_2d
    Rl.end_drawing
  end

  def self.destroy
    @@textures.each { |t| Rl.unload_texture t }
  end

  def self.run(seed = 1_000_000)
    Rl.init_window(screen_width, screen_height, "Mineshift(#{seed})")
    Rl.set_target_fps(60)

    Mineshift.setup(seed)

    until Rl.close_window?
      # Change the speed modifier for scrolling when holding the LeftTrigger
      raw_speed_mod = Rl.get_gamepad_axis_movement(0, Rl::GamepadAxis::LeftTrigger)
      speed_mod = (raw_speed_mod > 0 ? (raw_speed_mod + 1) * 2.0 : 1)
      @@axis_movement += (Rl.get_gamepad_axis_movement(0, Rl::GamepadAxis::LeftY) * speed_mod)

      Mineshift.draw

      # Randomize the seed when pressing space or A
      if Rl.key_pressed?(Rl::KeyboardKey::Space) || Rl.gamepad_button_pressed?(0, 7)
        seed = rand(1_000_000)

        Mineshift.setup(seed)
        Rl.set_window_title("Mineshift(#{seed})")
      end

      # Increment seed when pressing right or RB
      if Rl.key_pressed?(Rl::KeyboardKey::Right) || Rl.gamepad_button_pressed?(0, 11)
        seed &+= 1

        Mineshift.setup(seed)
        Rl.set_window_title("Mineshift(#{seed})")
      end

      # Decrement seed when pressing left or LB
      if Rl.key_pressed?(Rl::KeyboardKey::Left) || Rl.gamepad_button_pressed?(0, 9)
        seed &-= 1

        Mineshift.setup(seed)
        Rl.set_window_title("Mineshift(#{seed})")
      end

      # Show the seed on the middle of the screen when Q or the RT trigger is held.
      if Rl.key_pressed?(Rl::KeyboardKey::Q) || (Rl.get_gamepad_axis_movement(0, Rl::GamepadAxis::RightTrigger) > 0.5)
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
