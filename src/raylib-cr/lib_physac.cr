@[Link("physac")]
lib LibPhysAC
  # PhysAC
  PHYSAC_MAX_BODIES              =   64
  PHYSAC_MAX_MANIFOLDS           = 4096
  PHYSAC_MAX_VERTICES            =   24
  PHYSAC_DEFAULT_CIRCLE_VERTICES =   24

  PHYSAC_COLLISION_ITERATIONS   =      100
  PHYSAC_PENETRATION_ALLOWANCE  = 0.05_f32
  PHYSAC_PENETRATION_CORRECTION =  0.4_f32

  PHYSAC_PI      = 3.14159265358979323846_f32
  PHYSAC_DEG2RAD = (PHYSAC_PI/180.0_f32)

  enum PhysicsShapeType
    Circle  = 0
    Polygon
  end

  alias PhysicsBody = Pointer(PhysicsBodyData)
  alias PhysicsManifold = Pointer(PhysicsManifoldData)

  struct PhysicsBodyData
    id : LibC::UInt
    enabled : Bool
    position : LibRaylib::Vector2
    velocity : LibRaylib::Vector2
    force : LibRaylib::Vector2
    angular_velocity : LibC::Float
    torque : LibC::Float

    orient : LibC::Float
    inertia : LibC::Float
    inverse_inertia : LibC::Float
    mass : LibC::Float
    static_friction : LibC::Float
    dynamic_friction : LibC::Float

    use_gravity : Bool
    is_grounded : Bool
    freeze_orient : Bool
    shape : PhysicsShape
  end

  struct Matrix2x2
    m00 : LibC::Float
    m01 : LibC::Float
    m10 : LibC::Float
    m11 : LibC::Float
  end

  struct PhysicsVertexData
    vertex_count : LibC::UInt
    positions : StaticArray(LibRaylib::Vector2, PHYSAC_MAX_VERTICES)
    normals : StaticArray(LibRaylib::Vector2, PHYSAC_MAX_VERTICES)
  end

  struct PhysicsShape
    type : PhysicsShapeType
    body : PhysicsBody
    vertex_data : PhysicsVertexData
    radius : LibC::Float
    transform : Matrix2x2
  end

  struct PhysicsManifoldData
    id : LibC::UInt
    body_a : PhysicsBody
    body_b : PhysicsBody

    penetration : LibC::Float
    normal : LibRaylib::Vector2
    contacts : StaticArray(LibRaylib::Vector2, 2)
    contacts_count : LibC::UInt

    restitution : LibC::Float
    dynamic_friction : LibC::Float
    static_friction : LibC::Float
  end

  fun init_physics = InitPhysics
  fun update_physics = UpdatePhysics
  fun reset_physics = ResetPhysics
  fun close_physics = ClosePhysics
  fun set_physics_timestep = SetPhysicsTimeStep(delta : LibC::Double)
  fun set_physics_gravity = SetPhysicsGravity(x : LibC::Float, y : LibC::Float)

  fun create_physics_body_circle = CreatePhysicsBodyCircle(pos : LibRaylib::Vector2, radius : LibC::Float, density : LibC::Float) : PhysicsBody
  fun create_physics_body_rectangle = CreatePhysicsBodyRectangle(pos : LibRaylib::Vector2, width : LibC::Float, height : LibC::Float, density : LibC::Float) : PhysicsBody
  fun create_physics_body_polygon = CreatePhysicsBodyPolygon(pos : LibRaylib::Vector2, radius : LibC::Float, sides : LibC::Int, density : LibC::Float) : PhysicsBody
  fun destroy_physics_body = DestroyPhysicsBody(body : PhysicsBody)

  fun physics_add_force = PhysicsAddForce(body : PhysicsBody, force : LibRaylib::Vector2)
  fun physics_add_torque = PhysicsAddTorque(body : PhysicsBody, amount : LibC::Float)
  fun physics_shatter = PhysicsShatter(body : PhysicsBody, position : LibRaylib::Vector2, force : LibC::Float)
  fun set_physics_body_rotation = SetPhysicsBodyRotation(body : PhysicsBody, radians : LibC::Float)

  fun get_physics_body = GetPhysicsBody(index : LibC::Int) : PhysicsBody
  fun get_physics_bodies_count = GetPhysicsBodiesCount() : LibC::Int
  fun get_physics_shape_type = GetPhysicsShapeType(index : LibC::Int) : LibC::Int
  fun get_physics_shape_vertices_count = GetPhysicsShapeVerticesCount(index : LibC::Int) : LibC::Int
  fun get_physics_shape_vertex = GetPhysicsShapeVertex(body : PhysicsBody, vertex : LibC::Int) : LibRaylib::Vector2
end
