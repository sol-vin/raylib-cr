require "raylib-cr"
require "./wireland"

alias R = Raylib
alias V2 = R::Vector2
alias W = Wireland

module Screen
  WIDTH  = 800
  HEIGHT = 450

  module Zoom
    # Smallest zoom possible
    LIMIT_LOWER = 0.1_f32
    # Largest zoom possible
    LIMIT_UPPER = 5.0_f32
    # Unit to move zoom by
    UNIT = 0.05
  end
end

R.init_window(Screen::WIDTH, Screen::HEIGHT, "wireland")

R.set_target_fps(60)

pallette = W::Pallette::DEFAULT
circuit = W::Circuit.new

circuit_texture_loaded = false
circuit_texture = R::Texture.new

camera = R::Camera2D.new
camera.zoom = 1.0
camera.offset.x = Screen::WIDTH/2
camera.offset.y = Screen::HEIGHT/2

previous_camera_mouse_drag_pos = V2.zero

until R.close_window?
  if R.file_dropped?
    dropped_files = R.load_dropped_files
    files = [] of String
    dropped_files.count.times do |i|
      files << String.new dropped_files.paths[i]
    end
    R.unload_dropped_files(dropped_files)

    if pallette_file = files.find { |f| /\.pal$/ =~ f }
      pallette = W::Pallette.new(pallette_file)
    end

    if circuit_file = files.find { |f| /\.png$/ =~ f }
      circuit = W::Circuit.new(circuit_file, pallette)
      R.unload_texture(circuit_texture) if circuit_texture_loaded
      circuit_texture = R.load_texture(circuit_file)
      circuit_texture_loaded = true
    end
  end

  mouse_wheel = R.get_mouse_wheel_move * Screen::Zoom::UNIT
  if !mouse_wheel.zero?
    new_zoom = camera.zoom + mouse_wheel
    camera.zoom = new_zoom

    if camera.zoom < Screen::Zoom::LIMIT_LOWER
      camera.zoom = Screen::Zoom::LIMIT_LOWER
    elsif camera.zoom > Screen::Zoom::LIMIT_UPPER
      camera.zoom = Screen::Zoom::LIMIT_UPPER
    end
  end

  screen_mouse = V2.new
  screen_mouse.x = R.get_mouse_x
  screen_mouse.y = R.get_mouse_y

  world_mouse = R.get_screen_to_world_2d(screen_mouse, camera)

  if R.mouse_button_pressed?(R::MouseButton::Left)
    previous_camera_mouse_drag_pos = screen_mouse
  elsif R.mouse_button_down?(R::MouseButton::Left)
    camera.target = camera.target - ((screen_mouse - previous_camera_mouse_drag_pos) * 1/camera.zoom)

    previous_camera_mouse_drag_pos = screen_mouse
  elsif R.mouse_button_released?(R::MouseButton::Left)
    previous_camera_mouse_drag_pos.x = 0
    previous_camera_mouse_drag_pos.y = 0
  end

  R.begin_drawing
  R.begin_mode_2d camera
  R.clear_background(pallette.bg)
  if circuit_texture_loaded
    R.draw_texture_ex(circuit_texture, V2.new(x: 0, y: 0), 0, 20.0, R::WHITE)
  else
    R.draw_text("Drop a .pal or .png to begin!", 20, 20, 30, pallette.wire)
  end
  R.end_mode_2d
  R.end_drawing
end

R.unload_texture(circuit_texture) if circuit_texture_loaded
R.close_window
