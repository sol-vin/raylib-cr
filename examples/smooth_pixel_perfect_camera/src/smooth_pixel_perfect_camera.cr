require "raylib-cr"

alias Rl = Raylib

screen_width = 800
screen_height = 450

virtual_screen_width = 160
virtual_screen_height = 90

virtual_width_ratio = screen_width.to_f/virtual_screen_width.to_f
virtual_height_ratio = screen_height.to_f/virtual_screen_height.to_f

Rl.init_window(800, 450, "Hello World")

world_space_camera = Rl::Camera2D.new
world_space_camera.zoom = 1.0_f32

screen_space_camera = Rl::Camera2D.new
screen_space_camera.zoom = 1.0_f32

target = Rl.load_render_texture(virtual_screen_width, virtual_screen_height)

rec01 = Rl::Rectangle.new x: 70.0_f32, y: 35.0_f32, width: 20.0_f32, height: 20.0_f32
rec02 = Rl::Rectangle.new x: 90.0_f32, y: 55.0_f32, width: 30.0_f32, height: 10.0_f32
rec03 = Rl::Rectangle.new x: 80.0_f32, y: 65.0_f32, width: 15.0_f32, height: 25.0_f32

source_rec = Rl::Rectangle.new x: 0.0_f32, y: 0.0_f32, width: target.texture.width.to_f, height: -target.texture.height.to_f
dest_rec = Rl::Rectangle.new x: -virtual_width_ratio, y: -virtual_height_ratio, width: screen_width + (virtual_width_ratio*2), height: screen_height + (virtual_height_ratio*2)

origin = Rl::Vector2.new(x: 0.0_f32, y: 0.0_f32)
rotation = 0.0_f32
camera_x = 0.0_f32
camera_y = 0.0_f32

Rl.set_target_fps(60)

until Rl.close_window?
  rotation += 60.0_f32 * Rl.get_frame_time

  camera_x = (Math.sin(Rl.get_time).to_f * 50.0_f32) - 10.0_f32
  camera_y = Math.cos(Rl.get_time).to_f * 30.0_f32

  world_space_camera.target = Rl::Vector2.new(x: camera_x, y: camera_y)
  
  # world_space_camera.target.x = screen_space_camera.target.x.to_i
  # # screen_space_camera.target.x -= world_space_camera.target.x
  # # screen_space_camera.target.x *= virtual_width_ratio

  # world_space_camera.target.y = screen_space_camera.target.y.to_i
  # # screen_space_camera.target.y -= world_space_camera.target.y
  # # screen_space_camera.target.y *= virtual_height_ratio

  Rl.begin_texture_mode(target)
  Rl.clear_background(Rl::RAYWHITE)
  Rl.begin_mode_2d(world_space_camera)
  Rl.draw_rectangle_pro(rec01, origin, rotation, Rl::BLACK)
  Rl.draw_rectangle_pro(rec02, origin, -rotation, Rl::RED)
  Rl.draw_rectangle_pro(rec03, origin, -rotation + 45.0_f32, Rl::BLUE)
  Rl.end_mode_2d
  Rl.end_texture_mode

  Rl.begin_drawing
  Rl.clear_background(Rl::RED)
  Rl.begin_mode_2d(screen_space_camera)
  Rl.draw_texture_pro(target.texture, source_rec, dest_rec, origin, 0.0_f32, Rl::WHITE)
  Rl.end_mode_2d
  Rl.end_drawing
end
Rl.unload_render_texture(target)

Rl.close_window
