require "raylib-cr"

alias LibFerox = F
alias LibRaylib = R

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

circle : Pointer(F::Shape) = pointerof(F::Shape.new)
polygon : Pointer(F::Shape) = pointerof(F::Shape.new)

large_circle : Pointer(F::Body) = pointerof(F::Body.new)
cursor : Pointer(F::Body) = pointerof(F::Body.new)
cursor_clone : Pointer(F::Body) = pointerof(F::Body.new)

use_polygon_cursor = false

text = "LEFT-CLICK TO CHANGE THE SHAPE TYPE OF THE CURSOR!"
font_size = 20

def init_example
  circle = F.create_circle(F::Material.new, 4.0_f32)
  polygon = F.create_rectangle(
    F::Material.new,
    12.0_f32,
    6.0_f32,
  )
  large_circle = F.create_body_from_shape(
    BodyType::Static,
    BodyFlag::None,
    R::Vector2.new(
      x: Screen.width_in_meters,
      y: Screen.height_in_meters
    ),
    F.create_circle(F::Material.new, 10.0_f32)
  )

  cursor = F.create_body_from_shape(
    BodyType::Kinematic,
    BodyFlag::None,
    R::Vector2.zero,
    circle
  )

  cursor_clone = F.create_body_from_shape(
    BodyType::Kinematic,
    BodyFlag::None,
    R::Vector2.zero,
    circle
  )
end

def deinit_example
  F.release_shape(F.get_body_shape(large_circle))
  F.release_shape(large_circle)

  F.release_shape(circle)
  F.release_shape(polygon)

  F.release_shape(cursor_clone)
  F.release_shape(cursor)
end

def update_example
  F.set_body_position(cursor, F.vec2_pixels_to_meters(R.get_mouse_position))

  if R.mouse_button_pressed?(R::MouseButton::Left)
    use_polygon_cursor = !use_polygon_cursor

    if use_polygon_cursor
      F.attach_shape_to_body(cursor, polygon)
      F.attach_shape_to_body(cursor_clone, polygon)

    else
      F.attach_shape_to_body(cursor, circle)
      F.attach_shape_to_body(cursor_clone, circle)
    end
  elsif R.mouse_button_pressed?(R::MouseButton::Right)
    rotation = R::DEG2RAD * rand(360)

    F.set_body_rotation(cursor, rotation)
    F.set_body_rotation(cursor_clone, rotation)

  end
end

def draw_example
  R.begin_drawing
  R.clear_background(R::RAYWHITE)
  F.draw_body(large_circle, R::GRAY)
  F.draw_body_aabb(large_circle, 1.0_f32, R::GREEN)

  collision = F.compute_body_collision(cursor, large_circle)

  if collision.check
    F.set_body_position(
      cursor_clone,
      F.vec2_add(
        F.get_body_position cursor,
        F.vec2_scalar_multiply(
          collision.direction,
          -Math.max(
            collision.depths[0], collision.depths[1]
          )
        )
      )
    )

    F.draw_body_lines(cursor_clone, 2.0_f32, R::RED)

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
          F.scalar_multiply(
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

  F.draw_body(cursor, R.fade(R::BLACK, 0.75_f32))
  F.draw_body_aabb(cursor, 1.0_f32, R::GREEN)

  F.draw_fps(8, 8)

  R.draw_text_ex(
    R.get_font_default,
    text,
    R::Vector2.new(
      x: 0.5_f32 * (Screen.width - R.measure_text(text, font_size)),
      y: Screen.height / 16/0_f32
    ),
    font_size,
    2.0_f32,
    R.fade(R::GRAY, 0.85_f32)
  )
  R.end_drawing
end

R.set_config_flags(R::ConfigFlags::MSAA4xHint)
R.set_target_fps(60)
R.init_window(800, 450, "Hello World")

init_example

until R.close_window?
  update_example
  draw_example
end
deinit_example
R.close_window
