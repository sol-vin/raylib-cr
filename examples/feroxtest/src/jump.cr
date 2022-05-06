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

  def self.world_rect
    R::Rectangle.new(
      x: 0, y: 0,
      width:  width_in_meters,
      height: height_in_meters
    )
  end
end

class Brick
  property width : LibC::Float = 0.0_f32
  property height : LibC::Float = 0.0_f32
  property? is_jumping : Bool = false
  property? on_ground : Bool = false
  property body : Pointer(F::Body) = Pointer(F::Body).null

  def initialize(@width : LibC::Float , @height : LibC::Float)
  end
end

module Vars
  TEXT      = "PRESS SPACE TO JUMP!"
  FONT_SIZE = 30

  BOX_MATERIAL = F::Material.new(density: 2.25_f32, restitution: 0.0_f32, static_friction: 0.25_f32, dynamic_friction: 0.5_f32)
  BRICK_MATERIAL = F::Material.new(density: 1.85_f32, restitution: 0.0_f32, static_friction: 1.0_f32, dynamic_friction: 0.85_f32)
  PLATFORM_MATERIAL  = F::Material.new(density: 2.0_f32, restitution: 0.0_f32, static_friction: 1.25_f32, dynamic_friction: 1.0_f32)
  WALL_MATERIAL = F::Material.new(density: 2.5_f32, restitution: 0.0_f32, static_friction: 1.25_f32, dynamic_friction: 1.0_f32)

  MAX_WALL_COUNT = 3
  BRICK_HORIZONTAL_SPEED  = 0.016_f32
  BRICK_VERTICAL_SPEED  = 0.02_f32
  DELTA_TIME = (1.0_f32 / 60) * 100.0_f32

  class_property world : Pointer(F::World) = Pointer(F::World).null

  class_property walls = [] of Pointer(F::Body)

  class_property platform : Pointer(F::Body) = Pointer(F::Body).null
  class_property box : Pointer(F::Body) = Pointer(F::Body).null
  class_property box2 : Pointer(F::Body) = Pointer(F::Body).null

  class_property boxes : Array(Pointer(F::Body)) = [] of Pointer(F::Body)

  class_property brick = Brick.new(width: 40.0_f32, height: 80.0_f32)

  WALL_ID1 = 0
  WALL_ID2 = 1
  WALL_ID3 = 2

  PLATFORM_ID = 3
  BRICK_ID = 4
  BOX_ID = 5
end

def init_example
  Vars.world = F.create_world(
    F.vec2_scalar_multiply(F::WORLD_DEFAULT_GRAVITY, 0.00001_f32),
    Screen.world_rect
  )

  F.set_world_collision_handler(
    Vars.world,
    F::CollisionHandler.new(pre_solve: ->(c : Pointer(F::Collision)){on_collision_pre_solve(c)})
  )

  wall1_vertices_data = F::VerticesData.new(R::Vector2.zero)
  wall1_vertices_data[0] = F.vec2_pixels_to_meters(R::Vector2.new x: -0.1_f32 * Screen.width, y: -0.35_f32 * Screen.height)
  wall1_vertices_data[1] = F.vec2_pixels_to_meters(R::Vector2.new x: -0.1_f32 * Screen.width, y: 0.35_f32 * Screen.height)
  wall1_vertices_data[2] = F.vec2_pixels_to_meters(R::Vector2.new x: 0.1_f32 * Screen.width, y: 0.35_f32 * Screen.height)


  wall1_vertices = F::Vertices.new(
    data: wall1_vertices_data,
    count: 3
  )

  wall3_vertices_data = F::VerticesData.new(R::Vector2.zero)
  wall3_vertices_data[0] = F.vec2_pixels_to_meters(R::Vector2.new x: 0.1_f32 * Screen.width, y: -0.35_f32 * Screen.height)
  wall3_vertices_data[1] = F.vec2_pixels_to_meters(R::Vector2.new x: -0.1_f32 * Screen.width, y: 0.35_f32 * Screen.height)
  wall3_vertices_data[2] = F.vec2_pixels_to_meters(R::Vector2.new x: 0.1_f32 * Screen.width, y: 0.35_f32 * Screen.height)

  wall3_vertices = F::Vertices.new(
    data: wall3_vertices_data,
    count: 3
  )



  Vars.brick.body = F.create_body_from_shape(
    F::BodyType::Dynamic,
    F::BodyFlag::InfiniteInertia,
    F.vec2_pixels_to_meters(R::Vector2.new(x: 0.35_f32 * Screen.width, y: Screen.height / 3.0_f32)),
    F.create_rectangle(
      Vars::BRICK_MATERIAL,
      F.number_pixels_to_meters(Vars.brick.width),
      F.number_pixels_to_meters(Vars.brick.height)
    )
  )

  F.set_body_user_data(Vars.brick.body, pointerof(Vars::BRICK_ID))


  F.add_to_world(Vars.world, Vars.brick.body)

  Vars.walls << F.create_body_from_shape(
    F::BodyType::Static,
    F::BodyFlag::None,
    F.vec2_pixels_to_meters(R::Vector2.new(x: 0.1_f32 * Screen.width, y: 0.65_f32 * Screen.height)),
    F.create_polygon(Vars::WALL_MATERIAL, wall1_vertices)
  )

  F.set_body_user_data(Vars.walls[0], pointerof(Vars::WALL_ID1))

  Vars.walls << F.create_body_from_shape(
    F::BodyType::Static,
    F::BodyFlag::None,
    F.vec2_pixels_to_meters(R::Vector2.new(x: 0.5_f32 * Screen.width, y: Screen.height - 60)),
    F.create_rectangle(
      Vars::WALL_MATERIAL, 
      F.number_pixels_to_meters(Screen.width),
      F.number_pixels_to_meters(120.0_f32)
    )
  )
  F.set_body_user_data(Vars.walls[1], pointerof(Vars::WALL_ID2))



  Vars.walls << F.create_body_from_shape(
    F::BodyType::Static,
    F::BodyFlag::None,
    F.vec2_pixels_to_meters(R::Vector2.new(x: 0.9_f32 * Screen.width, y: 0.65_f32 * Screen.height)),
    F.create_polygon(Vars::WALL_MATERIAL, wall3_vertices)
  )

  F.set_body_user_data(Vars.walls[2], pointerof(Vars::WALL_ID3))


  Vars.walls.each {|w| F.add_to_world(Vars.world, w)}

  Vars.platform = F.create_body_from_shape(
    F::BodyType::Static,
    F::BodyFlag::None,
    F.vec2_pixels_to_meters(R::Vector2.new(x: 0.5_f32 * Screen.width, y: 0.75_f32 * Screen.height)),
    F.create_rectangle(
      Vars::PLATFORM_MATERIAL, 
      F.number_pixels_to_meters(0.5_f32 * Screen.width),
      F.number_pixels_to_meters(40.0_f32)
    )
  )
  F.set_body_user_data(Vars.platform, pointerof(Vars::PLATFORM_ID))


  F.add_to_world(Vars.world, Vars.platform)

  Vars.box = F.create_body_from_shape(
    F::BodyType::Dynamic,
    F::BodyFlag::InfiniteInertia,
    F.vec2_pixels_to_meters(R::Vector2.new(x: 0.5_f32 * Screen.width, y: 0.25_f32 * Screen.height)),
    F.create_rectangle(
      Vars::BOX_MATERIAL, 
      F.number_pixels_to_meters(50.0_f32),
      F.number_pixels_to_meters(40.0_f32)
    )
  )
  F.set_body_user_data(Vars.box, pointerof(Vars::BOX_ID))

  Vars.box2 = F.create_body_from_shape(
    F::BodyType::Dynamic,
    F::BodyFlag::None,
    F.vec2_pixels_to_meters(R::Vector2.new(x: 0.2_f32 * Screen.width, y: 0.4_f32 * Screen.height)),
    F.create_rectangle(
      Vars::BOX_MATERIAL, 
      F.number_pixels_to_meters(50.0_f32),
      F.number_pixels_to_meters(40.0_f32)
    )
  )
  F.set_body_user_data(Vars.box2, pointerof(Vars::BOX_ID))

  F.add_to_world(Vars.world, Vars.box)
  F.add_to_world(Vars.world, Vars.box2)

  5.times do
    a_box = F.create_body_from_shape(
      F::BodyType::Dynamic,
      F::BodyFlag::None,
      F.vec2_pixels_to_meters(R::Vector2.new(x: 0.2_f32 * Screen.width, y: 0.4_f32 * Screen.height)),
      F.create_rectangle(
        Vars::BOX_MATERIAL, 
        F.number_pixels_to_meters(50.0_f32),
        F.number_pixels_to_meters(40.0_f32)
      )
    )
    F.set_body_user_data(a_box, pointerof(Vars::BOX_ID))

    Vars.boxes << a_box
    F.add_to_world(Vars.world, a_box)

  end
  



end

def deinit_example
  F.release_world(Vars.world)
end

def update_example
  F.simulate_world(Vars.world, Vars::DELTA_TIME)

  handle_brick_movement
end

def handle_brick_movement
  position = F.get_body_position(Vars.brick.body)
  velocity = F.get_body_velocity(Vars.brick.body)

  half_brick_width = 0.5_f32 * F.number_pixels_to_meters(Vars.brick.width)
  half_brick_height = 0.5_f32 * F.number_pixels_to_meters(Vars.brick.height)

  if position.x <= half_brick_width
    position.x = half_brick_width
  elsif position.x >= Screen.width_in_meters - half_brick_width
    position.x = Screen.width_in_meters - half_brick_width
  end

  if R.key_down?(R::KeyboardKey::Left) || R.key_down?(R::KeyboardKey::Right)
    if R.key_down?(R::KeyboardKey::Left)
      velocity.x = -Vars::BRICK_HORIZONTAL_SPEED
    else
      velocity.x = Vars::BRICK_HORIZONTAL_SPEED
    end
  else
    velocity.x = 0.0_f32
  end

  if R.key_down?(R::KeyboardKey::Space) && !Vars.brick.is_jumping?
    Vars.brick.is_jumping = true
    Vars.brick.on_ground = false
    velocity.y = -Vars::BRICK_VERTICAL_SPEED
  end

  if Vars.brick.on_ground?
    Vars.brick.is_jumping = false
  end

  F.set_body_position(Vars.brick.body, position)
  F.set_body_velocity(Vars.brick.body, velocity)
end

def on_collision_pre_solve(collision : Pointer(F::Collision))
  b1 = collision.value.cache.bodies[0]
  b2 = collision.value.cache.bodies[1]

  data1 = F.get_body_user_data(b1).as(Pointer(Int32))
  data2 = F.get_body_user_data(b2).as(Pointer(Int32))

  if !data1.null? && !data2.null?
    if data1.value == Vars::BRICK_ID
      if collision.value.check && (collision.value.direction.y > 0.0_f32)
        Vars.brick.on_ground = true
      else
        Vars.brick.on_ground = false
      end
    end
  end
end

def draw_example
  R.begin_drawing
  R.clear_background(R::RAYWHITE)

  Vars.walls.each {|w| F.draw_body(w, R::BLACK)}
  F.draw_body(Vars.platform, R::BLACK)

  F.draw_body(Vars.box, R::BLUE)
  F.draw_body(Vars.box2, R::LIGHTGRAY)

  Vars.boxes.each {|body| F.draw_body(body, R::GREEN)}

  brick_body = Vars.brick.body
  F.draw_body(Vars.brick.body, R::RED)

  F.draw_spatial_hash(F.get_world_spatial_hash(Vars.world), 0.25_f32, R::GRAY)

  position = F.get_body_position(Vars.brick.body)
  velocity = F.get_body_velocity(Vars.brick.body)

  R.draw_text_ex(
    R.get_font_default,
    Vars::TEXT,
    R::Vector2.new(
      x: 0.5_f32 * (Screen.width - R.measure_text(Vars::TEXT, Vars::FONT_SIZE)),
      y: 0.125_f32 * Screen.height
    ),
    Vars::FONT_SIZE,
    2.0_f32,
    R.fade(R::GRAY, 0.85_f32)
  )

  R.draw_fps(8, 8)

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
