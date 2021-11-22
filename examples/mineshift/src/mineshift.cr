require "raylib-cr"
require "perlin_noise"
alias Rl = LibRaylib

module Mineshift
  COLORS = [
    [
      Rl::Color.new(r: 255_u8, g: 255_u8, b: 255_u8, a: 255_u8),
      Rl::Color.new(r: 170_u8, g: 170_u8, b: 170_u8, a: 255_u8),
      Rl::Color.new(r: 100_u8, g: 100_u8, b: 100_u8, a: 255_u8),
      Rl::Color.new(r: 50_u8, g: 50_u8, b: 50_u8, a: 255_u8),
      Rl::Color.new(r: 0_u8, g: 0_u8, b: 0_u8, a: 255_u8),
    ],

    [
      Rl::Color.new(r: 255_u8, g: 255_u8, b: 255_u8, a: 255_u8),
      Rl::Color.new(r: 170_u8, g: 170_u8, b: 170_u8, a: 255_u8),
      Rl::Color.new(r: 100_u8, g: 100_u8, b: 100_u8, a: 255_u8),
      Rl::Color.new(r: 50_u8, g: 50_u8, b: 50_u8, a: 255_u8),
      Rl::Color.new(r: 0_u8, g: 0_u8, b: 0_u8, a: 255_u8),
    ],
  ]

  MAX_LEVELS = 4

  LAYER_SIZES = {
    0 => 0.02,
    1 => 0.04,
    2 => 0.06,
    3 => 0.08,
  }

  # Data for the size of layers
  LAYER_DATA = {
    0 => {
      max_distance: ((@@screen_width/2)*LAYER_SIZES[0]).to_i * 10,
      max_blocks:   4,
      block_size:   ((@@screen_width/2)*LAYER_SIZES[0]).to_i,
      deviation:    4,
    },

    1 => {
      max_distance: ((@@screen_width/2)*LAYER_SIZES[1]).to_i * 12,
      max_blocks:   3,
      block_size:   ((@@screen_width/2)*LAYER_SIZES[1]).to_i,
      deviation:    2,
    },

    2 => {
      max_distance: ((@@screen_width/2)*LAYER_SIZES[2]).to_i * 16,
      max_blocks:   3,
      block_size:   ((@@screen_width/2)*LAYER_SIZES[2]).to_i,
      deviation:    3,
    },

    3 => {
      max_distance: ((@@screen_width/2)*LAYER_SIZES[3]).to_i * 20,
      max_blocks:   7,
      block_size:   ((@@screen_width/2)*LAYER_SIZES[3]).to_i,
      deviation:    2,
    },
  }

  COLOR_SEED                 = 0.111123_f32
  BLOCK_SPACING_SEED         = 0.283673_f32
  CENTER_MASK_DEVIATION_SEED = 0.834728_f32

  class_getter textures = StaticArray(Rl::Texture2D, 4).new { Rl::Texture2D.new }

  class_getter camera = Rl::Camera2D.new

  class_setter screen_width = 1000
  class_setter screen_height = 500
  class_setter screen_ratio = 1.0_f32
  class_setter height_multiplier = 4

  @@perlin = PerlinNoise.new(1_000_000)

  # Do preliminary setup
  def self.setup(seed = 1_000_000)
    destroy
    Rl.init_window(@@screen_width, @@screen_height, "Mineshift")
    Rl.set_target_fps(60)

    # zero out old stuff
    @@textures = StaticArray(Rl::Texture2D, 4).new { Rl::Texture2D.new }
    @@camera = Rl::Camera2D.new
    @@camera.zoom = 1.0_f32

    @@perlin = PerlinNoise.new(seed)
  end

  # Makes the center chasm mask for a layer.
  private def self.make_center_rects(layer : UInt8)
    raise "Invalid layer #{layer}" unless layer < 4

    # zero out layer
    output = [] of Rl::Rectangle
    center = (@@screen_width/2).to_i
    current_height = 0
    # Perlin counter (provides random values by increasing seed)
    p_counter = 1

    until current_height > (@@screen_height * @@height_multiplier)
      mask_rect = Rl::Rectangle.new

      additional_block_spacing = @@perlin.prng_int(p_counter, current_height, layer + 1, 0, LAYER_DATA[layer][:max_blocks], BLOCK_SPACING_SEED) * LAYER_DATA[layer][:block_size]
      mask_rect.width = LAYER_DATA[layer][:max_distance] - additional_block_spacing
      mask_rect.height = LAYER_DATA[layer][:block_size] + 1 # Offset by one because of svg antialiasing issues

      position_x = center - (mask_rect.width/2).to_i
      deviation = (@@perlin.int(current_height, p_counter, layer + 1, -LAYER_DATA[layer][:deviation], LAYER_DATA[layer][:deviation], CENTER_MASK_DEVIATION_SEED) * LAYER_DATA[layer][:block_size])
      mask_rect.y = current_height - 1 # Offset by one to ensure lines don't draw
      mask_rect.x = position_x - deviation
      current_height += LAYER_DATA[layer][:block_size]
      p_counter += 1

      output << mask_rect
    end
    output
  end

  def self.render_layers
    4_u8.times { |x| render_layer x }
  end

  def self.render_layer(layer : UInt8)
    raise "Invalid layer #{layer}" unless layer < 4

    # We will render to this texture for the layer
    render_texture = Rl.load_render_texture(@@screen_width, @@screen_height * @@height_multiplier)

    Rl.begin_texture_mode(render_texture)
    Rl.clear_background(Rl::WHITE)
    Rl.begin_mode_2d(@@camera)

    # Draw the center chasm mask
    make_center_rects(layer).each do |rect|
      Rl.draw_rectangle_rec(rect, Rl::BLACK)
    end

    Rl.end_mode_2d
    Rl.end_texture_mode

    # Make an image
    image = Rl.load_image_from_texture(render_texture.texture)

    # Replace the color black with transparency
    Rl.image_color_replace(pointerof(image), Rl::BLACK, Rl::Color.new(r: 0_u8, g: 0_u8, b: 0_u8, a: 0_u8))
    # Replace white with the color of the layer
    Rl.image_color_replace(pointerof(image), Rl::WHITE, COLORS[0][layer + 1])
    # Reload the texture from the image
    @@textures[layer] = Rl.load_texture_from_image(image)

    # Clean up the old data
    Rl.unload_image(image)
    Rl.unload_render_texture(render_texture)
  end

  def self.draw
    Rl.begin_drawing
    Rl.clear_background(COLORS[0][0])
    Rl.begin_mode_2d(@@camera)

    offset = 0
    offset -= 20 * Rl.get_time

    4.times do |x|
      layer_offset = offset * (x + 1)
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


    Mineshift.setup(seed)
    Mineshift.render_layers

    until Rl.close_window?
      Mineshift.draw
    end

    Mineshift.destroy

    Rl.close_window
  end
end

Mineshift.run
