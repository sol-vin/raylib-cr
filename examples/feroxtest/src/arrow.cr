require "raylib-cr"

alias F = LibFerox
alias R = LibRaylib

module Screen
  class_property width : LibC::Float = 800
  class_property height : LibC::Float = 600

  def self.width_in_meters
    F.number_pixels_to_meters(width)
  end

  def self.height_in_meters
    F.number_pixels_to_meters(height)
  end
end

module Vars
  @@shape_v : F::Shape = F::Shape.new
  class_property circle : Pointer(F::Shape) = pointerof(@@shape_v)
  class_property polygon : Pointer(F::Shape) = pointerof(@@shape_v)

  @@body_v : F::Body = F::Body.new

  class_property large_circle : Pointer(F::Body) = pointerof(@@body_v)
  class_property cursor : Pointer(F::Body) = pointerof(@@body_v)
  class_property cursor_clone : Pointer(F::Body) = pointerof(@@body_v)

  class_property? use_polygon_cursor = false

  TEXT      = "LEFT-CLICK TO CHANGE THE SHAPE TYPE OF THE CURSOR!"
  FONT_SIZE = 20
end

def init_example
  Vars.circle = F.create_circle(F::Material.new, 4.0_f32)
  Vars.polygon = F.create_rectangle(
    F::Material.new,
    12.0_f32,
    6.0_f32,
  )
  Vars.large_circle = F.create_body_from_shape(
    F::BodyType::Static,
    F::BodyFlag::None,
    R::Vector2.new(
      x: Screen.width_in_meters * 0.5_f32,
      y: Screen.height_in_meters * 0.5_f32
    ),
    F.create_circle(F::Material.new, 10.0_f32)
  )

  Vars.cursor = F.create_body_from_shape(
    F::BodyType::Kinematic,
    F::BodyFlag::None,
    R::Vector2.zero,
    Vars.circle
  )

  Vars.cursor_clone = F.create_body_from_shape(
    F::BodyType::Kinematic,
    F::BodyFlag::None,
    R::Vector2.zero,
    Vars.circle
  )
end

def deinit_example
  F.release_shape(F.get_body_shape(Vars.large_circle))
  F.release_body(Vars.large_circle)

  F.release_shape(Vars.circle)
  F.release_shape(Vars.polygon)

  F.release_body(Vars.cursor_clone)
  F.release_body(Vars.cursor)
end

def update_example
  F.set_body_position(Vars.cursor, F.vec2_pixels_to_meters(R.get_mouse_position))

  if R.mouse_button_pressed?(R::MouseButton::Left)
    Vars.use_polygon_cursor = !Vars.use_polygon_cursor?

    if Vars.use_polygon_cursor?
      F.attach_shape_to_body(Vars.cursor, Vars.polygon)
      F.attach_shape_to_body(Vars.cursor_clone, Vars.polygon)
    else
      F.attach_shape_to_body(Vars.cursor, Vars.circle)
      F.attach_shape_to_body(Vars.cursor_clone, Vars.circle)
    end
  elsif R.mouse_button_pressed?(R::MouseButton::Right)
    rotation = R::DEG2RAD * rand(360)

    F.set_body_rotation(Vars.cursor, rotation)
    F.set_body_rotation(Vars.cursor_clone, rotation)
  end
end

def draw_example
  R.begin_drawing
  R.clear_background(R::RAYWHITE)
  F.draw_body(Vars.large_circle, R::GRAY)
  F.draw_body_aabb(Vars.large_circle, 1.0_f32, R::GREEN)

  collision = F.compute_body_collision(Vars.cursor, Vars.large_circle)

  if collision.check
    F.set_body_position(
      Vars.cursor_clone,
      F.vec2_add(
        F.get_body_position(Vars.cursor),
        F.vec2_scalar_multiply(
          collision.direction,
          -Math.max(
            collision.depths[0], collision.depths[1]
          )
        )
      )
    )

    F.draw_body_lines(Vars.cursor_clone, 2.0_f32, R::RED)

    collision.count.times do |i|
      R.draw_ring(
        F.vec2_meters_to_pixels(collision.points[i]),
        4.0_f32,
        6.0_f32,
        0.0_f32,
        360.0_f32,
        32,
        R::RED
      )

      F.draw_arrow(
        F.vec2_add(
          collision.points[i],
          F.vec2_scalar_multiply(
            collision.direction,
            -collision.depths[i]
          )
        ),
        collision.points[i],
        2,
        R::RED
      )
    end
  end

  F.draw_body(Vars.cursor, R.fade(R::BLACK, 0.75_f32))
  F.draw_body_aabb(Vars.cursor, 1.0_f32, R::GREEN)

  R.draw_fps(8, 8)

  R.draw_text_ex(
    R.get_font_default,
    Vars::TEXT,
    R::Vector2.new(
      x: 0.5_f32 * (Screen.width - R.measure_text(Vars::TEXT, Vars::FONT_SIZE)),
      y: Screen.height / 16.0_f32
    ),
    Vars::FONT_SIZE,
    2.0_f32,
    R.fade(R::GRAY, 0.85_f32)
  )
  R.end_drawing
end

R.set_config_flags(R::ConfigFlags::MSAA4xHint)
R.set_target_fps(60)
R.init_window(Screen.width, Screen.height, "Hello World")

init_example

until R.close_window?
  update_example
  draw_example
end
deinit_example
R.close_window
