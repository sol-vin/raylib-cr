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
  alias WC = Wireland::Component

  alias Rectangle = NamedTuple(x: Int32, y: Int32, width: Int32, height: Int32)

  module Scale
    CIRCUIT = 5.0
  end

  module Screen
    WIDTH  = 800
    HEIGHT = 450

    module Zoom
      # Smallest zoom possible
      LIMIT_LOWER = 0.11_f32
      # Largest zoom possible
      LIMIT_UPPER = 5.0_f32
      # Unit to move zoom by
      UNIT = 0.1
    end
  end

  module Keys
    HELP         = R::KeyboardKey::Slash
    PULSES       = R::KeyboardKey::Q
    SOLID_PULSES = R::KeyboardKey::W
    TICK         = R::KeyboardKey::Space
    RESET        = R::KeyboardKey::R
  end

  module Mouse
    CAMERA   = R::MouseButton::Middle
    INTERACT = R::MouseButton::Left
    INFO     = R::MouseButton::Right
  end

  module Colors
    HIGH                     = R::GREEN
    WILL_LOSE_ACTIVE_PULSE   = R::RED
    WILL_ACTIVE_PULSE        = R::SKYBLUE
    IS_AND_WILL_ACTIVE_PULSE = R::MAGENTA
  end

  @@pallette = W::Pallette::DEFAULT
  @@circuit = W::Circuit.new
  @@circuit_texture = R::Texture.new

  @@component_texture = R::Texture.new
  @@component_atlas = Array(Rectangle).new
  @@component_bounds = Array(Rectangle).new

  @@camera = R::Camera2D.new
  @@camera.zoom = Screen::Zoom::LIMIT_LOWER
  @@camera.offset.x = Screen::WIDTH/2
  @@camera.offset.y = Screen::HEIGHT/2

  @@previous_camera_mouse_drag_pos = V2.zero

  @@show_help = false
  @@show_pulses = false
  @@solid_pulses = false

  @@info_id : UInt64? = nil

  @@last_active_pulses = [] of UInt64
  @@last_pulses = [] of UInt64

  def self.reset
    @@circuit.reset
    @@circuit.pulse_inputs

    @@last_active_pulses.clear
    @@last_pulses.clear
  end

  # Checks to see if the circuit texture is loaded.
  def self.is_circuit_loaded?
    !(@@circuit_texture.width == 0 && @@circuit_texture.height == 0)
  end

  # Adapted from https://github.com/mapbox/potpack/blob/main/index.js
  private def self._pack_boxes(boxes : Array(Rectangle))
    area = 0
    max_width = 0

    atlas_boxes = boxes.map_with_index do |box, i|
      area += box[:width] * box[:height]
      max_width = Math.max(box[:width], max_width)
      {bounds: box, id: i}
    end

    atlas_boxes.sort! { |a, b| b[:bounds][:height] <=> a[:bounds][:width] }
    atlas_boxes.map! do |a_b|
      {
        bounds: {
          x:      0,
          y:      0,
          width:  a_b[:bounds][:width],
          height: a_b[:bounds][:height],
        },

        id: a_b[:id],
      }
    end

    start_width = Math.max((Math.sqrt(area / 0.95)).ceil, max_width)
    spaces = [{x: 0, y: 0, width: start_width, height: Int32::MAX}]

    width = 0
    height = 0

    atlas = atlas_boxes.map do |a_b|
      box = a_b[:bounds]
      (spaces.size - 1).downto(0) do |space_i|
        space = spaces[space_i]
        next if (box[:width] > space[:width] || box[:height] > space[:height])

        box = {
          x:      space[:x],
          y:      space[:y],
          width:  box[:width],
          height: box[:height],
        }

        height = Math.max(height, box[:y] + box[:height])
        width = Math.max(width, box[:x] + box[:width])

        if box[:width] == space[:width] && box[:height] == space[:height]
          last = spaces.pop
          spaces << last if space_i < spaces.size
        elsif box[:height] == space[:height]
          spaces[space_i] = {
            x:      space[:x] + box[:width],
            y:      space[:y],
            width:  space[:width] - box[:width],
            height: space[:height],
          }
        elsif box[:width] == space[:width]
          spaces[space_i] = {
            x:      space[:x],
            y:      space[:y] + box[:height],
            width:  space[:width],
            height: space[:height] - box[:height],
          }
        else
          spaces << {
            x:      space[:x] + box[:width],
            y:      space[:y],
            width:  space[:width] - box[:width],
            height: box[:height],
          }

          spaces[space_i] = {
            x:      space[:x],
            y:      space[:y] + box[:height],
            width:  space[:width],
            height: space[:height] - box[:height],
          }
        end
        break
      end
      {
        bounds: box,
        id:     a_b[:id],
      }
    end.sort do |a, b|
      a[:id] <=> b[:id]
    end.map do |a_b|
      a_b[:bounds]
    end

    {atlas: atlas, width: width, height: height}
  end

  # Handles when files are dropped into the window, specifically .pal and .png files.
  def self.handle_dropped_files
    if R.file_dropped?
      dropped_files = R.load_dropped_files
      # Go through all the files dropped
      files = [] of String
      dropped_files.count.times do |i|
        files << String.new dropped_files.paths[i]
      end
      # Unload the files afterwards
      R.unload_dropped_files(dropped_files)

      # Find the first palette file
      if pallette_file = files.find { |f| /\.pal$/ =~ f }
        @@pallette = W::Pallette.new(pallette_file)
      end

      # Find the first png file
      if circuit_file = files.find { |f| /\.png$/ =~ f }
        # Load the file into texture memory.
        @@camera.zoom = Screen::Zoom::LIMIT_LOWER
        @@camera.target.x = 0
        @@camera.target.y = 0

        @@circuit = W::Circuit.new(circuit_file, @@pallette)
        R.unload_texture(@@circuit_texture) if is_circuit_loaded?
        @@circuit_texture = R.load_texture(circuit_file)

        reset

        R.unload_texture(@@component_texture) if @@component_texture.width != 0 && @@component_texture.height != 0

        # Map the component textures by getting the bounds and creating a texture for it.
        @@component_bounds = @@circuit.components.map do |c|
          x_sort = c.xy.sort { |a, b| a[:x] <=> b[:x] }
          y_sort = c.xy.sort { |a, b| a[:y] <=> b[:y] }

          min_x = x_sort[0][:x]
          max_x = x_sort.last[:x]
          min_y = y_sort[0][:y]
          max_y = y_sort.last[:y]

          bounds = {
            x:      (min_x * Scale::CIRCUIT).to_i,
            y:      (min_y * Scale::CIRCUIT).to_i,
            width:  ((max_x - min_x + 1) * Scale::CIRCUIT).to_i,
            height: ((max_y - min_y + 1) * Scale::CIRCUIT).to_i,
          }
          bounds
        end

        atlas = _pack_boxes(@@component_bounds)
        @@component_atlas = atlas[:atlas]
        render_texture = R.load_render_texture(atlas[:width], atlas[:height])

        R.begin_texture_mode(render_texture)
        R.clear_background(R::BLACK)
        @@circuit.components.each do |c|
          c.xy.each do |xy|
            R.draw_rectangle(
              @@component_atlas[c.id][:x] + ((xy[:x] * Scale::CIRCUIT) - @@component_bounds[c.id][:x]) + 1,
              @@component_atlas[c.id][:y] + ((xy[:y] * Scale::CIRCUIT) - @@component_bounds[c.id][:y]) + 1,
              Scale::CIRCUIT - 2,
              Scale::CIRCUIT - 2,
              R::WHITE
            )
          end
          R.set_window_title("wireland #{((1.0 - ((@@circuit.last_id - c.id)/@@circuit.last_id)) * 100).floor}%")
        end
        R.end_texture_mode
        delimit = ""
        {% if flag?(:windows) %}
          delimit = "\\"
        {% else %}
          delimit = "/"
        {% end %}
        R.set_window_title("wireland #{circuit_file.split(delimit).last}")

        # Make an image out of our render texture
        image = R.load_image_from_texture(render_texture.texture)

        # Replace the color black with transparency
        R.image_color_replace(pointerof(image), R::BLACK, R::Color.new(r: 0_u8, g: 0_u8, b: 0_u8, a: 0_u8))
        R.image_flip_vertical(pointerof(image))
        # Reload the texture from the image
        @@component_texture = R.load_texture_from_image(image)

        # Clean up the old data
        R.unload_image(image)
        R.unload_render_texture(render_texture)
      end
    end
  end

  # private def self._draw_loading_screen(current_id)
  #   R.begin_drawing
  #   R.clear_background(@@pallette.bg)
  #   loading_text = "Loading!"
  #   loading_text_size = R.measure_text(loading_text, 30)/2
  #   loading_text_size = 30
  #   R.draw_text(loading_text, Screen::WIDTH/2 - loading_text_size, Screen::HEIGHT/2 - loading_text_size/2, loading_text_size, @@pallette.wire)
  #   R.draw_rectangle(0, Screen::HEIGHT - Screen::HEIGHT/10, ((1.0 - ((@@circuit.last_id - current_id)/@@circuit.last_id)) * Screen::WIDTH).to_i, Screen::HEIGHT/10 - Screen::HEIGHT/20, @@pallette.wire)
  #   R.end_drawing
  # end

  # Handles how the mouse moves the camera
  def self.handle_camera_mouse
    # Only go if the circuit is loaded
    if is_circuit_loaded?
      # Do the zoom stuff for MWheel
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

      # Translate cursor coords
      screen_mouse = V2.new
      screen_mouse.x = R.get_mouse_x
      screen_mouse.y = R.get_mouse_y

      world_mouse = R.get_screen_to_world_2d(screen_mouse, @@camera)

      if R.mouse_button_pressed?(Mouse::CAMERA)
        @@previous_camera_mouse_drag_pos = screen_mouse
      elsif R.mouse_button_down?(Mouse::CAMERA)
        @@camera.target = @@camera.target - ((screen_mouse - @@previous_camera_mouse_drag_pos) * 1/@@camera.zoom)

        @@previous_camera_mouse_drag_pos = screen_mouse
      elsif R.mouse_button_released?(Mouse::CAMERA)
        @@previous_camera_mouse_drag_pos.x = 0
        @@previous_camera_mouse_drag_pos.y = 0
      end
    end
  end

  def self.handle_info
    if @@info_id.nil? && R.mouse_button_released?(Mouse::INFO)
      screen_mouse = V2.new
      screen_mouse.x = R.get_mouse_x
      screen_mouse.y = R.get_mouse_y

      world_mouse = R.get_screen_to_world_2d(screen_mouse, @@camera)

      clicked = @@circuit.components.find do |c|
        c.xy.any? do |xy|
          min_xy = {x: xy[:x] * Scale::CIRCUIT - @@circuit_texture.width/2, y: xy[:y] * Scale::CIRCUIT - @@circuit_texture.height/2}
          max_xy = {x: xy[:x] * Scale::CIRCUIT + Scale::CIRCUIT - @@circuit_texture.width/2, y: xy[:y] * Scale::CIRCUIT + Scale::CIRCUIT - @@circuit_texture.height/2}

          world_mouse.x > min_xy[:x] &&
            world_mouse.y > min_xy[:y] &&
            world_mouse.x < max_xy[:x] &&
            world_mouse.y < max_xy[:y]
        end
      end

      if clicked
        @@info_id = clicked.id
      end
    elsif [Mouse::CAMERA, Mouse::INTERACT, Mouse::INFO].any? { |mb| R.mouse_button_released?(mb) }
      @@info_id = nil
    end
  end

  # Handles what keys do when pressed.
  def self.handle_keys
    if is_circuit_loaded?
      if R.key_released?(Keys::HELP)
        @@show_help = !@@show_help
      end

      if R.key_released?(Keys::PULSES)
        @@show_pulses = !@@show_pulses
      end

      if R.key_released?(Keys::SOLID_PULSES)
        @@solid_pulses = !@@solid_pulses
      end

      if R.key_released?(Keys::TICK)
        @@circuit.increase_ticks
        @@circuit.pulse_inputs
        @@circuit.pre_tick

        @@last_active_pulses = @@circuit.active_pulses.keys

        @@circuit.mid_tick
        @@last_pulses = @@circuit.components.select(&.high?).map(&.id)

        @@circuit.post_tick
      end

      if R.key_released?(Keys::RESET)
        reset
      end
    end
  end

  def self.handle_io_mouse
    if R.mouse_button_released?(Mouse::INTERACT)
      screen_mouse = V2.new
      screen_mouse.x = R.get_mouse_x
      screen_mouse.y = R.get_mouse_y

      world_mouse = R.get_screen_to_world_2d(screen_mouse, @@camera)

      clicked_io = @@circuit.components.select(&.is_a?(WC::InputOn | WC::InputOff | WC::InputToggleOn | WC::InputToggleOff)).find do |io|
        io.xy.any? do |xy|
          min_xy = {x: xy[:x] * Scale::CIRCUIT - @@circuit_texture.width/2, y: xy[:y] * Scale::CIRCUIT - @@circuit_texture.height/2}
          max_xy = {x: xy[:x] * Scale::CIRCUIT + Scale::CIRCUIT - @@circuit_texture.width/2, y: xy[:y] * Scale::CIRCUIT + Scale::CIRCUIT - @@circuit_texture.height/2}

          world_mouse.x > min_xy[:x] &&
            world_mouse.y > min_xy[:y] &&
            world_mouse.x < max_xy[:x] &&
            world_mouse.y < max_xy[:y]
        end
      end

      if clicked_io
        clicked_io.as(Wireland::IO).toggle
      end
    end
  end

  def self.draw_circuit
    R.draw_texture_ex(@@circuit_texture, V2.new(x: -@@circuit_texture.width/2, y: -@@circuit_texture.height/2), 0, Scale::CIRCUIT, R::WHITE)
  end

  def self.draw_components
    @@circuit.components.each do |c|
      if (@@show_pulses && (
           @@last_pulses.includes?(c.id) ||
           @@last_active_pulses.includes?(c.id) ||
           @@circuit.active_pulses.keys.includes?(c.id)
         ) ||
         c.is_a?(Wireland::RelayPole) ||
         c.is_a?(Wireland::IO)
           )
        color = R::Color.new

        if @@circuit.active_pulses.keys.includes?(c.id) && @@last_active_pulses.includes?(c.id)
          color = Colors::IS_AND_WILL_ACTIVE_PULSE
        elsif @@last_active_pulses.includes?(c.id)
          color = Colors::WILL_LOSE_ACTIVE_PULSE
        elsif @@circuit.active_pulses.keys.includes?(c.id)
          color = Colors::WILL_ACTIVE_PULSE
        elsif @@last_pulses.includes? c.id
          color = Colors::HIGH
        end

        if c.is_a?(Wireland::IO | Wireland::RelayPole)
          special_color = R::Color.new
          if c.is_a?(WC::InputOff | WC::InputOn | WC::InputToggleOff | WC::InputToggleOn)
            io = c.as(Wireland::IO)
            special_color = io.color

            if io.on? && @@last_active_pulses.includes?(c.id)
              color = Colors::IS_AND_WILL_ACTIVE_PULSE
            elsif io.on?
              color = Colors::WILL_ACTIVE_PULSE
            elsif io.off? && (@@last_active_pulses.includes?(c.id) || @@circuit.active_pulses.keys.includes?(c.id))
              color = Colors::WILL_LOSE_ACTIVE_PULSE
            end
          elsif c.is_a?(Wireland::IO)
            io = c.as(Wireland::IO)
            special_color = io.color
          end

          c.xy.each do |xy|
            R.draw_rectangle(
              xy[:x] * Scale::CIRCUIT - @@circuit_texture.width/2,
              xy[:y] * Scale::CIRCUIT - @@circuit_texture.height/2,
              Scale::CIRCUIT,
              Scale::CIRCUIT,
              special_color
            )
          end

          if c.is_a?(Wireland::RelayPole) && !c.conductive?
            c.xy.each do |xy|
              R.draw_rectangle(
                xy[:x] * Scale::CIRCUIT - @@circuit_texture.width/2 + 1,
                xy[:y] * Scale::CIRCUIT - @@circuit_texture.height/2 + 1,
                Scale::CIRCUIT - 2,
                Scale::CIRCUIT - 2,
                @@pallette.bg
              )
            end
          end
        end
        if @@show_pulses && !@@solid_pulses
          R.draw_texture_rec(
            @@component_texture,
            R::Rectangle.new(
              x: @@component_atlas[c.id][:x],
              y: @@component_atlas[c.id][:y],
              width: @@component_atlas[c.id][:width],
              height: @@component_atlas[c.id][:height],
            ),
            V2.new(x: @@component_bounds[c.id][:x] - @@circuit_texture.width/2, y: @@component_bounds[c.id][:y] - @@circuit_texture.height/2),
            color
          )
        elsif @@show_pulses
          c.xy.each do |xy|
            R.draw_rectangle(
              xy[:x] * Scale::CIRCUIT - @@circuit_texture.width/2,
              xy[:y] * Scale::CIRCUIT - @@circuit_texture.height/2,
              Scale::CIRCUIT,
              Scale::CIRCUIT,
              color
            )
          end
        end
      end
    end
  end

  def self.draw_info
    if info_id = @@info_id
      width = Screen::WIDTH/2
      height = Screen::HEIGHT/2

      rect = {
        x:      width/2,
        y:      height/2,
        width:  width,
        height: height,
      }

      R.draw_rectangle(
        rect[:x],
        rect[:y],
        width,
        height,
        @@pallette.wire
      )

      center_x = Screen::WIDTH/2

      text = "#{@@circuit[info_id].class.to_s.split("::").last}"
      text_size = 40
      text_length = R.measure_text(text, text_size)
      R.draw_text(
        text,
        center_x - text_length/2,
        rect[:y] + 10,
        text_size,
        @@pallette.bg
      )

      text = "ID: #{@@info_id}"
      text_size = 25
      text_length = R.measure_text(text, text_size)
      R.draw_text(
        text,
        rect[:x] + 30,
        rect[:y] + 50,
        text_size,
        @@pallette.bg
      )

      text = "HIGH: #{@@last_pulses.includes? info_id}"
      text_size = 25
      text_length = R.measure_text(text, text_size)
      R.draw_text(
        text,
        rect[:x] + 30,
        rect[:y] + 50 + (text_size + 10),
        text_size,
        @@pallette.bg
      )

      if @@circuit[info_id].is_a?(Wireland::IO)
        io = @@circuit[info_id].as(Wireland::IO)
        text = "ON: #{io.on?}"
        text_size = 25
        text_length = R.measure_text(text, text_size)
        R.draw_text(
          text,
          rect[:x] + 30,
          rect[:y] + 50 + (text_size + 10) * 2,
          text_size,
          @@pallette.bg
        )
      elsif @@circuit[info_id].is_a?(Wireland::RelayPole)
        text = "CONDUCTIVE: #{@@circuit[info_id].conductive?}"
        text_size = 25
        text_length = R.measure_text(text, text_size)
        R.draw_text(
          text,
          rect[:x] + 30,
          rect[:y] + 50 + (text_size + 10) * 2,
          text_size,
          @@pallette.bg
        )
      elsif @@circuit[info_id].class.active?
        text = "ACTIVE: #{@@last_active_pulses.includes?(info_id)}"
        text_size = 25
        text_length = R.measure_text(text, text_size)
        R.draw_text(
          text,
          rect[:x] + 30,
          rect[:y] + 50 + (text_size + 10)*2,
          text_size,
          @@pallette.bg
        )

        text = "WILL ACTIVE: #{@@circuit.active_pulses.keys.includes?(info_id)}"
        text_size = 25
        text_length = R.measure_text(text, text_size)
        R.draw_text(
          text,
          rect[:x] + 30,
          rect[:y] + 50 + (text_size + 10)*3,
          text_size,
          @@pallette.bg
        )
      end
    end
  end

  def self.run
    R.init_window(Screen::WIDTH, Screen::HEIGHT, "wireland")
    R.set_target_fps(60)

    until R.close_window?
      if @@info_id.nil?
        handle_dropped_files

        handle_camera_mouse

        handle_io_mouse

        handle_keys
      end

      handle_info

      R.begin_drawing
      R.clear_background(@@pallette.bg)
      if !is_circuit_loaded?
        R.draw_text("Drop a .pal or .png to begin!", 20, 20, 30, @@pallette.wire)
      end
      R.begin_mode_2d @@camera
      if is_circuit_loaded?
        draw_circuit

        draw_components
      end
      R.end_mode_2d
      draw_info

      R.end_drawing
    end

    R.unload_texture(@@circuit_texture) if is_circuit_loaded?
    R.unload_texture(@@component_texture) if @@component_texture.width != 0

    R.close_window
  end
end

Wireland::App.run
