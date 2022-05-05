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


lib LibJump
  struct Brick
    width : LibC::Float
    height : LibC::Float
    is_jumping : Bool
    on_ground : Bool
    body : F::Body*
  end
end

module Vars
  TEXT      = "PRESS SPACE TO JUMP!"
  FONT_SIZE = 30

  BOX_MATERIAL = F::Material.new(density: 2.25_f32, restitution: 0.0_f32, static_friction: 1.25_f32, dynamic_friction: 1.0_f32)
  BRICK_MATERIAL = F::Material.new(density: 1.85_f32, restitution: 0.0_f32, static_friction: 1.0_f32, dynamic_friction: 0.85_f32)
  PLATFORM_MATERIAL  = F::Material.new(density: 2.0_f32, restitution: 0.0_f32, static_friction: 1.25_f32, dynamic_friction: 1.0_f32)
  WALL_MATERIAL = F::Material.new(density: 2.5_f32, restitution: 0.0_f32, static_friction: 1.25_f32, dynamic_friction: 1.0_f32)

  MAX_WALL_COUNT = 3
  BRICK_HORIZONTAL_SPEED  = 0.016_f32
  BRICK_VERTICAL_SPEED  = 0.02_f32
  DELTA_TIME = (1.0_f32 / 60) * 100.0_f32

  class_property world : Pointer(F::World) = Pointer(F::World).null
  class_property wall1 : Pointer(F::Body) = Pointer(F::Body).null
  class_property wall2 : Pointer(F::Body) = Pointer(F::Body).null
  class_property wall3 : Pointer(F::Body) = Pointer(F::Body).null

  class_property platform : Pointer(F::Body) = Pointer(F::Body).null
  class_property box : Pointer(F::Body) = Pointer(F::Body).null
  class_property box2 : Pointer(F::Body) = Pointer(F::Body).null

  class_property boxes : Array(Pointer(F::Body)) = [] of Pointer(F::Body)

  @@brick_obj = LibJump::Brick.new(width: 40.0_f32, height: 80.0_f32)
  class_property brick : Pointer(LibJump::Brick) = pointerof(@@brick_obj)

  WALL_ID1 = 0
  @@wall_id1_obj = WALL_ID1
  class_property wall_id1 : Pointer(Int32) = pointerof(@@wall_id1_obj)

  WALL_ID2 = 1
  @@wall_id2_obj = 1
  class_property wall_id2 : Pointer(Int32) = pointerof(@@wall_id2_obj)

  WALL_ID3 = 2
  @@wall_id3_obj = 2
  class_property wall_id3 : Pointer(Int32) = pointerof(@@wall_id3_obj)

  PLATFORM_ID = 3
  @@platform_id_obj = PLATFORM_ID
  class_property platform_id : Pointer(Int32) = pointerof(@@platform_id_obj)

  BRICK_ID = 4
  @@brick_id_obj = BRICK_ID
  class_property brick_id : Pointer(Int32) = pointerof(@@brick_id_obj)

  BOX_ID = 5
  @@box_id_obj = BOX_ID
  class_property box_id : Pointer(Int32) = pointerof(@@box_id_obj)
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



  Vars.brick.value.body = F.create_body_from_shape(
    F::BodyType::Dynamic,
    F::BodyFlag::InfiniteInertia,
    F.vec2_pixels_to_meters(R::Vector2.new(x: 0.35_f32 * Screen.width, y: Screen.height / 3.0_f32)),
    F.create_rectangle(
      Vars::BRICK_MATERIAL,
      F.number_pixels_to_meters(Vars.brick.value.width),
      F.number_pixels_to_meters(Vars.brick.value.height)
    )
  )

  F.set_body_user_data(Vars.brick.value.body, Vars.brick_id)


  F.add_to_world(Vars.world, Vars.brick.value.body)

  Vars.wall1 = F.create_body_from_shape(
    F::BodyType::Static,
    F::BodyFlag::None,
    F.vec2_pixels_to_meters(R::Vector2.new(x: 0.1_f32 * Screen.width, y: 0.65_f32 * Screen.height)),
    F.create_polygon(Vars::WALL_MATERIAL, wall1_vertices)
  )
  pp Vars.wall1

  F.set_body_user_data(Vars.wall1, Vars.wall_id1)

  Vars.wall2 = F.create_body_from_shape(
    F::BodyType::Static,
    F::BodyFlag::None,
    F.vec2_pixels_to_meters(R::Vector2.new(x: 0.5_f32 * Screen.width, y: Screen.height - 60)),
    F.create_rectangle(
      Vars::WALL_MATERIAL, 
      F.number_pixels_to_meters(Screen.width),
      F.number_pixels_to_meters(120.0_f32)
    )
  )
  F.set_body_user_data(Vars.wall2, Vars.wall_id2)


  Vars.wall3 = F.create_body_from_shape(
    F::BodyType::Static,
    F::BodyFlag::None,
    F.vec2_pixels_to_meters(R::Vector2.new(x: 0.9_f32 * Screen.width, y: 0.65_f32 * Screen.height)),
    F.create_polygon(Vars::WALL_MATERIAL, wall3_vertices)
  )

  F.set_body_user_data(Vars.wall3, Vars.wall_id3)

  F.add_to_world(Vars.world, Vars.wall1)
  F.add_to_world(Vars.world, Vars.wall2)
  F.add_to_world(Vars.world, Vars.wall3)

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
  F.set_body_user_data(Vars.platform, Vars.platform_id)


  F.add_to_world(Vars.world, Vars.platform)

  Vars.box = F.create_body_from_shape(
    F::BodyType::Dynamic,
    F::BodyFlag::None,
    F.vec2_pixels_to_meters(R::Vector2.new(x: 0.5_f32 * Screen.width, y: 0.25_f32 * Screen.height)),
    F.create_rectangle(
      Vars::BOX_MATERIAL, 
      F.number_pixels_to_meters(50.0_f32),
      F.number_pixels_to_meters(40.0_f32)
    )
  )
  F.set_body_user_data(Vars.box, Vars.box_id)

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
  F.set_body_user_data(Vars.box2, Vars.box_id)

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
    F.set_body_user_data(a_box, Vars.box_id)

    Vars.boxes << a_box
    F.add_to_world(Vars.world, a_box)

  end
  



end

def deinit_example
  F.release_world(Vars.world)
end

def update_example
  F.simulate_world(Vars.world, Vars::DELTA_TIME)

  handle_brick_movement(Vars.world, Vars.brick)
end

def handle_brick_movement(world : F::World*, brick : Pointer(LibJump::Brick))
  position = F.get_body_position(Vars.brick.value.body)
  velocity = F.get_body_velocity(Vars.brick.value.body)

  half_brick_width = 0.5_f32 * F.number_pixels_to_meters(Vars.brick.value.width)
  half_brick_height = 0.5_f32 * F.number_pixels_to_meters(Vars.brick.value.height)

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

  if R.key_down?(R::KeyboardKey::Space) && !Vars.brick.value.is_jumping
    Vars.brick.value.is_jumping = true
    Vars.brick.value.on_ground = false
    velocity.y = -Vars::BRICK_VERTICAL_SPEED
  end

  if Vars.brick.value.on_ground
    Vars.brick.value.is_jumping = false
  end

  F.set_body_position(Vars.brick.value.body, position)
  F.set_body_velocity(Vars.brick.value.body, velocity)
end

def on_collision_pre_solve(collision : Pointer(F::Collision))
  b1 = collision.value.cache.bodies[0]
  b2 = collision.value.cache.bodies[1]

  data1 = F.get_body_user_data(b1).as(Pointer(Int32))
  data2 = F.get_body_user_data(b2).as(Pointer(Int32))

  if !data1.null? && !data2.null?
    if data1.value == Vars::BRICK_ID
      if collision.value.check && (collision.value.direction.y > 0.0_f32)
        Vars.brick.value.on_ground = true
      else
        Vars.brick.value.on_ground = false
      end
    end
  end
end

def draw_example
  R.begin_drawing
  R.clear_background(R::RAYWHITE)

  F.draw_body(Vars.wall1, R::BLACK)
  F.draw_body(Vars.wall2, R::BLACK)
  F.draw_body(Vars.wall3, R::BLACK)
  F.draw_body(Vars.platform, R::BLACK)

  F.draw_body(Vars.box, R::DARKGRAY)
  F.draw_body(Vars.box2, R::LIGHTGRAY)

  Vars.boxes.each {|body| F.draw_body(body, R::GREEN)}

  brick_body = Vars.brick.value.body
  F.draw_body(Vars.brick.value.body, R::RED)

  F.draw_spatial_hash(F.get_world_spatial_hash(Vars.world), 0.25_f32, R::GRAY)

  position = F.get_body_position(Vars.brick.value.body)
  velocity = F.get_body_velocity(Vars.brick.value.body)

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
