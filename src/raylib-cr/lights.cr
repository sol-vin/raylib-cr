struct Raylib::Light
  type : Lights::Type
  position : Vector3
  target : Vector3
  color : Color
  enabled : Bool

  enabled_loc : LibC::Int
  type_loc : LibC::Int
  pos_loc : LibC::Int
  target_loc : LibC::Int
  color_loc : LibC::Int
end

module Raylib::Lights
  MAX = 4

  class_getter count = 0

  enum Type
    Directional
    Point
  end

  def self.create(type : Type, position : Vector3, target : Vector3, color : Color, shader : Shader) : Light
    light = Light.new

    if @@count < MAX
      light.enabled = true
      light.type = type
      light.position = position
      light.target = target
      light.color = color

      light.enabled_loc = Raylib.get_shader_location(shader, "lights[0#{@@count}].enabled")
      light.type_loc = Raylib.get_shader_location(shader, "lights[0#{@@count}].type")
      light.pos_loc = Raylib.get_shader_location(shader, "lights[0#{@@count}].position")
      light.target_loc = Raylib.get_shader_location(shader, "lights[0#{@@count}].target")
      light.color_loc = Raylib.get_shader_location(shader, "lights[0#{@@count}].color")

      update(shader, light)
      @@count += 1
    else
      raise "Too many lights!"
    end

    return light
  end

  def self.update(shader : Shader, light : Light)
    Raylib.set_shader_value(shader, light.enabled_loc, light.enabled, Raylib::ShaderUniformDataType::Int)
    Raylib.set_shader_value(shader, light.type_loc, light.type.value, Raylib::ShaderUniformDataType::Int)

    Raylib.set_shader_value(shader, light.pos_loc, LibC::Float32[light.position.x, light.position.y, light.position.z], Raylib::ShaderUniformDataType::Vec3)
    Raylib.set_shader_value(shader, light.target_loc, LibC::Float32[light.target.x, light.target.y, light.target.z], Raylib::ShaderUniformDataType::Vec3)
    Raylib.set_shader_value(shader, light.color_loc, LibC::Float32[
      light.color.r/255.0_f32,
      light.color.g/255.0_f32,
      light.color.b/255.0_f32,
      light.color.a/255.0_f32,
    ], Raylib::ShaderUniformDataType::Vec4)
  end
end
