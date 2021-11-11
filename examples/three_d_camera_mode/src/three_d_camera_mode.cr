require "raylib-cr"
screen_width = 800
screen_height = 450

LibRaylib.init_window(screen_width, screen_height, "Hello World")

camera = LibRaylib::Camera3D.new
camera.position = LibRaylib::Vector3.new x: 0.0, y: 10.0, z: 10.0
camera.target = LibRaylib::Vector3.new x: 0.0, y: 0.0, z: 0.0
camera.up = LibRaylib::Vector3.new x: 0.0, y: 1.0, z: 0.0
camera.fovy = 45.0
camera.projection = LibRaylib::CameraProjection::Perspective

cube_position = LibRaylib::Vector3.new(x: 0, y: 0, z: 0)

LibRaylib.set_target_fps(60)

until LibRaylib.close_window?
  LibRaylib.begin_drawing
  LibRaylib.clear_background(LibRaylib::RAYWHITE)
  LibRaylib.begin_mode_3d(camera)
  LibRaylib.draw_cube(cube_position, 2.0, 2.0, 2.0, LibRaylib::RED)
  LibRaylib.draw_cube_wires(cube_position, 2.0, 2.0, 2.0, LibRaylib::MAROON)
  LibRaylib.draw_grid(10, 1.0)
  LibRaylib.end_mode_3d

  LibRaylib.end_drawing

end

LibRaylib.close_window
