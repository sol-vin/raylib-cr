require "raylib-cr"
require "./wireland"

# Button layout

# ? - Help
# Space - Tick
# Q - Show Pulses
# R - Reset

module Wireland::App
  alias R = Raylib
  alias V2 = R::Vector2
  alias W = Wireland

  module Scale
    CIRCUIT = 10.0
  end

  module Screen
    WIDTH  = 800
    HEIGHT = 450

    module Zoom
      # Smallest zoom possible
      LIMIT_LOWER = 0.2_f32
      # Largest zoom possible
      LIMIT_UPPER = 5.0_f32
      # Unit to move zoom by
      UNIT = 0.1
    end
  end

  module Keys
    HELP = R::KeyboardKey::Slash
    PULSES = R::KeyboardKey::Q
    TICK = R::KeyboardKey::Space
    RESET = R::KeyboardKey::R
  end

  @@pallette = W::Pallette::DEFAULT
  @@circuit = W::Circuit.new
  @@circuit_texture = R::Texture.new
  @@component_textures = [] of NamedTuple(render: R::Texture2D, bounds: R::Rectangle)

  @@camera = R::Camera2D.new
  @@camera.zoom = Screen::Zoom::LIMIT_LOWER
  @@camera.offset.x = Screen::WIDTH/2
  @@camera.offset.y = Screen::HEIGHT/2

  @@previous_camera_mouse_drag_pos = V2.zero

  @@fade = 0.0
  @@fade_up = false

  @@show_help = false
  @@show_pulses = false
  
  @@last_active_pulses = [] of UInt64

  def self.is_circuit_loaded?
    !(@@circuit_texture.width == 0 && @@circuit_texture.height == 0)
  end

  def self.handle_dropped_files
    if R.file_dropped?
      dropped_files = R.load_dropped_files
      files = [] of String
      dropped_files.count.times do |i|
        files << String.new dropped_files.paths[i]
      end
      R.unload_dropped_files(dropped_files)

      if pallette_file = files.find { |f| /\.pal$/ =~ f }
        @@pallette = W::Pallette.new(pallette_file)
      end

      if circuit_file = files.find { |f| /\.png$/ =~ f }
        @@camera.zoom = Screen::Zoom::LIMIT_LOWER
        @@camera.target.x = 0
        @@camera.target.y = 0

        @@circuit = W::Circuit.new(circuit_file, @@pallette)
        R.unload_texture(@@circuit_texture) if is_circuit_loaded?
        @@circuit_texture = R.load_texture(circuit_file)

        @@last_active_pulses = @@circuit.active_pulses.keys

        if !@@component_textures.empty?
          @@component_textures.each { |t| R.unload_texture(t[:render]) }
        end
        
        @@component_textures = @@circuit.components.map do |c|
          x_sort = c.xy.sort { |a, b| a[:x] <=> b[:x] }
          y_sort = c.xy.sort { |a, b| a[:y] <=> b[:y] }

          min_x = x_sort[0][:x]
          max_x = x_sort.last[:x]
          min_y = y_sort[0][:y]
          max_y = y_sort.last[:y]

          bounds = R::Rectangle.new(
            x: min_x,
            y: min_y,
            width: max_x - min_x + 1,
            height: max_y - min_y + 1
          )

          render_texture = R.load_render_texture(bounds.width, bounds.height)

          R.begin_texture_mode(render_texture)
          R.clear_background(R::BLACK)

          c.xy.each do |xy|
            R.draw_rectangle(xy[:x] - min_x, xy[:y] - min_y, 1, 1, R::WHITE)
          end

          R.end_texture_mode

          # Make an image out of our render texture
          image = R.load_image_from_texture(render_texture.texture)

          # Replace the color black with transparency
          R.image_color_replace(pointerof(image), R::BLACK, R::Color.new(r: 0_u8, g: 0_u8, b: 0_u8, a: 0_u8))
          R.image_flip_vertical(pointerof(image))
          # Reload the texture from the image
          texture = R.load_texture_from_image(image)

          # Clean up the old data
          R.unload_image(image)
          R.unload_render_texture(render_texture)

          {render: texture, bounds: bounds}
        end
      end
    end
  end

  def self.handle_camera_mouse
    if is_circuit_loaded?
      mouse_wheel = R.get_mouse_wheel_move * Screen::Zoom::UNIT
      if !mouse_wheel.zero?
        new_zoom = @@camera.zoom + mouse_wheel
        @@camera.zoom = new_zoom

        if @@camera.zoom < Screen::Zoom::LIMIT_LOWER
          @@camera.zoom = Screen::Zoom::LIMIT_LOWER
        elsif @@camera.zoom > Screen::Zoom::LIMIT_UPPER
          @@camera.zoom = Screen::Zoom::LIMIT_UPPER
        end
      end

      screen_mouse = V2.new
      screen_mouse.x = R.get_mouse_x
      screen_mouse.y = R.get_mouse_y

      world_mouse = R.get_screen_to_world_2d(screen_mouse, @@camera)

      if R.mouse_button_pressed?(R::MouseButton::Left)
        @@previous_camera_mouse_drag_pos = screen_mouse
      elsif R.mouse_button_down?(R::MouseButton::Left)
        @@camera.target = @@camera.target - ((screen_mouse - @@previous_camera_mouse_drag_pos) * 1/@@camera.zoom)

        @@previous_camera_mouse_drag_pos = screen_mouse
      elsif R.mouse_button_released?(R::MouseButton::Left)
        @@previous_camera_mouse_drag_pos.x = 0
        @@previous_camera_mouse_drag_pos.y = 0
      end
    end
  end

  def self.handle_keys
    if is_circuit_loaded?
      if R.key_released?(Keys::HELP)
        @@show_help = !@@show_help
      end

      if R.key_released?(Keys::PULSES)
        @@show_pulses = !@@show_pulses
        @@fade = 1.0
      end

      if R.key_released?(Keys::TICK)
        if @@circuit.ticks != 0
          @@circuit.post_tick
        end

        @@last_active_pulses = @@circuit.active_pulses.keys

        @@circuit.increase_ticks
        @@circuit.pre_tick
      end

      if R.key_released?(Keys::RESET)
        @@circuit.reset
      end
    end
  end

  def self.run
    R.init_window(Screen::WIDTH, Screen::HEIGHT, "wireland")
    R.set_target_fps(60)

    until R.close_window?
      handle_dropped_files

      handle_camera_mouse

      handle_keys

      R.begin_drawing
      R.clear_background(@@pallette.bg)
      if !is_circuit_loaded?
        R.draw_text("Drop a .pal or .png to begin!", 20, 20, 30, @@pallette.wire)
      end
      R.begin_mode_2d @@camera
      if is_circuit_loaded?
        R.draw_texture_ex(@@circuit_texture, V2.new(x: -@@circuit_texture.width/2, y: -@@circuit_texture.height/2), 0, Scale::CIRCUIT, R::WHITE)

        if @@show_pulses
          # if @@fade_up
          #   @@fade += 0.1
          # else
          #   @@fade -= 0.1
          # end

          # if @@fade > 1.0
          #   @@fade = 1.0
          #   @@fade_up = false
          # elsif @@fade < 0.5
          #   @@fade = 0.5
          #   @@fade_up = true
          # end
          
          @@circuit.components.each do |c|
            if c.high? || @@last_active_pulses.includes? c.id
              t_b = @@component_textures[c.id]
              bounds = R::Rectangle.new(
                x: t_b[:bounds].x * Scale::CIRCUIT,
                y: t_b[:bounds].y * Scale::CIRCUIT,
                width: t_b[:bounds].width * Scale::CIRCUIT,
                height: t_b[:bounds].height * Scale::CIRCUIT
              )
              color = R::Color.new

              if @@last_active_pulses.includes? c.id
                color = R::MAGENTA
              else
                color = R::RED
              end

              R.draw_texture_ex(
                t_b[:render], 
                V2.new(x:bounds.x-@@circuit_texture.width/2, y: bounds.y-@@circuit_texture.height/2), 
                0, 
                Scale::CIRCUIT, 
                R.fade(color, 1.0))
            end
          end
        end
      end
      R.end_mode_2d
      R.end_drawing
    end

    R.unload_texture(@@circuit_texture) if is_circuit_loaded?
    @@component_textures.each do |t_b|
      R.unload_texture(t_b[:render])
    end

    R.close_window
  end
end

Wireland::App.run
