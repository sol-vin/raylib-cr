require "raylib-cr"

screen_width = 800
screen_height = 450

Raylib.init_window(screen_width, screen_height, "Hello World")

camera = Raylib::Camera3D.new
camera.position = Raylib::Vector3.new x: 0.0, y: 10.0, z: 10.0
camera.target = Raylib::Vector3.new x: 0.0, y: 0.0, z: 0.0
camera.up = Raylib::Vector3.new x: 0.0, y: 1.0, z: 0.0
camera.fovy = 45.0
camera.projection = Raylib::CameraProjection::Perspective

cube_position = Raylib::Vector3.new(x: 0, y: 0, z: 0)

Raylib.set_target_fps(60)

until Raylib.close_window?
  Raylib.begin_drawing
  Raylib.clear_background(Raylib::RAYWHITE)
  Raylib.begin_mode_3d(camera)
  Raylib.draw_cube(cube_position, 2.0, 2.0, 2.0, Raylib::RED)
  Raylib.draw_cube_wires(cube_position, 2.0, 2.0, 2.0, Raylib::MAROON)
  Raylib.draw_grid(10, 1.0)
  Raylib.end_mode_3d

  Raylib.end_drawing
end

Raylib.close_window
