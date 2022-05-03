require "raylib-cr"

alias R = LibRaylib
alias P = LibPhysAC

module Screen
  class_getter width = 800
  class_getter height = 450
end

def remake_static_objects
  floor = P.create_physics_body_rectangle(R::Vector2.new(x: Screen.width/2.0_f32, y: Screen.height), 500, 100, 10)
  floor.value.enabled = false

  circle = P.create_physics_body_circle(R::Vector2.new(x: Screen.width/2.0_f32, y: Screen.height/2.0_f32), 45, 10)
  circle.value.enabled = false
end


R.set_config_flags(R::ConfigFlags::Msaa4xHint)
R.init_window(Screen.width, Screen.height, "raylib [physac] example - physics demo")

logo_x = Screen.width - R.measure_text("Physac", 30) - 10
logo_y = 15

P.init_physics

remake_static_objects

R.set_target_fps(60)

until R.close_window?
  P.update_physics

  if R.key_pressed?(R::KeyboardKey::R)
    P.reset_physics
    remake_static_objects
  end

  if R.mouse_button_pressed?(R::MouseButton::Left)
    P.create_physics_body_polygon(R.get_mouse_position, 40, 5, 10)
  elsif R.mouse_button_pressed?(R::MouseButton::Right)
    P.create_physics_body_circle(R.get_mouse_position, 20, 10)
  end

  bodies_count = P.get_physics_bodies_count
  (bodies_count - 1).downto(0) do |i|
    body = P.get_physics_body i
    P.destroy_physics_body(body) if !body.null? && (body.value.position.y > Screen.height*2)
  end

  R.begin_drawing
  R.clear_background R::BLACK
  R.draw_fps(Screen.width - 90, Screen.height - 30)

  bodies_count = P.get_physics_bodies_count
  bodies_count.times do |i|
    body = P.get_physics_body i

    if !body.null?
      vertex_count = P.get_physics_shape_vertices_count i
      vertex_count.times do |j|
        vertex_a = P.get_physics_shape_vertex(body, j)
        jj = (((j + 1) < vertex_count) ? (j + 1) : 0)
        vertex_b = P.get_physics_shape_vertex(body, jj)

        R.draw_line_v(vertex_a, vertex_b, R::GREEN)
      end
    end
  end
  R.draw_text("Left mouse button to create a polygon", 10, 10, 10, R::WHITE)
  R.draw_text("Right mouse button to create a circle", 10, 25, 10, R::WHITE)
  R.draw_text("Press 'R' to reset example", 10, 40, 10, R::WHITE)
  R.draw_text("Physac", logo_x, logo_y, 30, R::WHITE)
  R.draw_text("Powered by", logo_x + 50, logo_y - 7, 10, R::WHITE)

  R.end_drawing
end

P.close_physics

R.close_window
