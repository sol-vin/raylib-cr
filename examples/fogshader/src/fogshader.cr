# rewrite of https://bedroomcoders.co.uk/raylib-fog/

require "raylib-cr"
alias Rl = Raylib
alias Vec3 = Rl::Vector3

Rl.init_window 1920, 1080, "fog demo"
Rl.toggle_fullscreen
Rl.set_target_fps 60

camera = Rl::Camera3D.new(
  up: Vec3.new(y: 1), fovy: 70.0,
  target: Vec3.new(x: 30),
  position: Vec3.new(y: 8),
  projection: Rl::CameraProjection::Perspective)

fog = Rl.load_shader "rsrc/shd/fog.vs", "rsrc/shd/fog.fs"
fog_color = [1_f32, 1_f32, 1_f32, 1_f32]
fog_density = 0.07_f32

Rl.set_shader_value fog, Rl.get_shader_location(fog, "fogColor"), fog_color, Rl::ShaderUniformDataType::Vec4
Rl.set_shader_value fog, Rl.get_shader_location(fog, "FogDensity"), pointerof(fog_density), Rl::ShaderUniformDataType::Float

mesh = Rl.gen_mesh_cube 2, 2, 2
model = Rl.load_model_from_mesh mesh

# set model shader, workaround for struct shenanigans
m = model.materials[0]
m.shader = fog
model.materials[0] = m

view_loc = Rl.get_shader_location fog, "viewPos"

until Rl.close_window?
  Rl.update_camera pointerof(camera), Rl::CameraMode::Orbital

  pos = [camera.position.x, camera.position.y, camera.position.z]
  Rl.set_shader_value fog, view_loc, pos, Rl::ShaderUniformDataType::Vec3
  Rl.begin_drawing
  Rl.clear_background Rl::WHITE
  Rl.begin_mode_3d camera
  20.times do |x|
    Rl.draw_model model, Vec3.new(x: x*3), 1.0, Rl::BLACK
  end
  Rl.end_mode_3d
  Rl.end_drawing
end
Rl.close_window
