require "raylib-cr"

alias Rl = Raylib

def draw_sphere_basic(color : Rl::Color)
  rings = 16
  slices = 16

  RLGL.check_render_batch_limit((rings + 2)*slices*6)

  RLGL.begin(RLGL::TRIANGLES)
  RLGL.color_4ub(color.r, color.g, color.b, color.a)
  (rings+2).times do |i|
    (slices+2).times do |j|
      RLGL.vertex_3f(Math.cos(Rl::DEG2RAD*(270+(180/(rings + 1))*i))*Math.sin(Rl::DEG2RAD*(j*360/slices)),
        Math.sin(Rl::DEG2RAD*(270+(180/(rings + 1))*i)),
        Math.cos(Rl::DEG2RAD*(270+(180/(rings + 1))*i))*Math.cos(Rl::DEG2RAD*(j*360/slices)))
      RLGL.vertex_3f(Math.cos(Rl::DEG2RAD*(270+(180/(rings + 1))*(i+1)))* Math.sin(Rl::DEG2RAD*((j+1)*360/slices)),
        Math.sin(Rl::DEG2RAD*(270+(180/(rings + 1))*(i+1))),
        Math.cos(Rl::DEG2RAD*(270+(180/(rings + 1))*(i+1)))*Math.cos(Rl::DEG2RAD*((j+1)*360/slices)))
      RLGL.vertex_3f(Math.cos(Rl::DEG2RAD*(270+(180/(rings + 1))*(i+1)))*Math.sin(Rl::DEG2RAD*(j*360/slices)),
        Math.sin(Rl::DEG2RAD*(270+(180/(rings + 1))*(i+1))),
        Math.cos(Rl::DEG2RAD*(270+(180/(rings + 1))*(i+1)))*Math.cos(Rl::DEG2RAD*(j*360/slices)))

      RLGL.vertex_3f(Math.cos(Rl::DEG2RAD*(270+(180/(rings + 1))*i))*Math.sin(Rl::DEG2RAD*(j*360/slices)),
        Math.sin(Rl::DEG2RAD*(270+(180/(rings + 1))*i)),
        Math.cos(Rl::DEG2RAD*(270+(180/(rings + 1))*i))*Math.cos(Rl::DEG2RAD*(j*360/slices)))
      RLGL.vertex_3f(Math.cos(Rl::DEG2RAD*(270+(180/(rings + 1))*(i)))*Math.sin(Rl::DEG2RAD*((j+1)*360/slices)),
        Math.sin(Rl::DEG2RAD*(270+(180/(rings + 1))*(i))),
        Math.cos(Rl::DEG2RAD*(270+(180/(rings + 1))*(i)))*Math.cos(Rl::DEG2RAD*((j+1)*360/slices)))
      RLGL.vertex_3f(Math.cos(Rl::DEG2RAD*(270+(180/(rings + 1))*(i+1)))*Math.sin(Rl::DEG2RAD*((j+1)*360/slices)),
        Math.sin(Rl::DEG2RAD*(270+(180/(rings + 1))*(i+1))),
        Math.cos(Rl::DEG2RAD*(270+(180/(rings + 1))*(i+1)))*Math.cos(Rl::DEG2RAD*((j+1)*360/slices)));
    end
  end
  RLGL.end
end

screen_width = 800
screen_height = 450

sun_radius = 4.0_f32
earth_radius = 0.6_f32
earth_orbit_radius = 8.0_f32
moon_radius = 0.16_f32
moon_orbit_radius = 1.5_f32


Rl.init_window(screen_width, screen_height, "RLGL Solar System")

camera = Rl::Camera.new
camera.position = Rl::Vector3.new(x: 16.0_f32, y: 16.0_f32, z: 16.0_f32)
camera.target = Rl::Vector3.new(x: 0.0_f32, y: 0.0_f32, z: 0.0_f32)
camera.up = Rl::Vector3.new(x: 0.0_f32, y: 1.0_f32, z: 0.0_f32)
camera.fovy = 45.0_f32
camera.projection = Rl::CameraProjection::Perspective

Rl.set_camera_mode(camera, Rl::CameraMode::Free)

rotation_speed = 0.2_f32 

earth_rotation = 0.0_f32
earth_orbit_rotation = 0.0_f32
moon_rotation = 0.0_f32
moon_orbit_rotation = 0.0_f32

Rl.set_target_fps(60)

until Rl.close_window?
  Rl.update_camera(pointerof(camera))
  earth_rotation += (5.0_f32 * rotation_speed)
  earth_orbit_rotation += (365/360.0_f32*(5.0_f32*rotation_speed)*rotation_speed)
  moon_rotation += (2.0_f32*rotation_speed)
  moon_orbit_rotation += (8.0_f32*rotation_speed);

  Rl.begin_drawing
  Rl.clear_background(Rl::RAYWHITE)
  Rl.begin_mode_3d(camera)

  RLGL.push_matrix
  RLGL.scale_f(sun_radius, sun_radius, sun_radius)
  draw_sphere_basic(Rl::GOLD)
  RLGL.pop_matrix

  RLGL.push_matrix
  RLGL.rotate_f(earth_orbit_rotation, 0.0_f32, 1.0_f32, 0.0_f32)
  RLGL.translate_f(earth_orbit_radius, 0.0_f32, 0.0_f32)

  RLGL.push_matrix
  RLGL.rotate_f(earth_rotation, 0.25, 1.0, 0.0)
  RLGL.scale_f(earth_radius, earth_radius, earth_radius)
  draw_sphere_basic(Rl::BLUE)
  RLGL.pop_matrix

  RLGL.rotate_f(moon_orbit_rotation, 0.0_f32, 1.0_f32, 0.0_f32)
  RLGL.translate_f(moon_orbit_radius, 0.0_f32, 0.0_f32)
  RLGL.rotate_f(moon_rotation, 0.0_f32, 1.0_f32, 0.0_f32)
  RLGL.scale_f(moon_radius, moon_radius, moon_radius)
  draw_sphere_basic(Rl::LIGHTGRAY)
  RLGL.pop_matrix

  Rl.draw_circle_3d(Rl::Vector3.new(x: 0.0_f32, y: 0.0_f32, z: 0.0_f32), earth_orbit_radius, Rl::Vector3.new(x: 1.0_f32, y: 0.0_f32, z: 0.0_f32), 90.0_f32, Rl.fade(Rl::RED, 0.5_f32))
  Rl.draw_grid(20, 1.0_f32)
  Rl.end_mode_3d
  Rl.end_drawing
end

Rl.close_window
