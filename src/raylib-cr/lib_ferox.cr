@[Link("ferox")]
lib LibFerox
  FR_GEOMETRY_MAX_VERTEX_COUNT = 8

  enum BodyType
    Unknown   = -1
    Static
    Kinematic
    Dynamic
  end

  enum BodyFlag
    None            = 0
    InfiniteMass    = 1
    InfiniteInertia = 2
  end

  alias BodyFlags = LibC::UChar

  enum ShapeType
    Unknown
    Circle
    Polygon
  end

  struct Material
    density : LibC::Float
    restitution : LibC::Float
    static_friction : LibC::Float
    dynamic_friction : LibC::Float
  end

  struct TransformCache
    valid : Bool
    sin_a : LibC::Float
    sin_b : LibC::Float
  end

  struct Transform
    position : LibRaylib::Vector2
    rotation : LibC::Float
    cache : TransformCache
  end

  struct Vertices
    data : StaticArray(LibRaylib::Vector2, FR_GEOMETRY_MAX_VERTEX_COUNT)
    count : LibC::Int
  end

  struct Circle
    radius : LibC::Float
  end

  struct Polygon
    vertices : Vertices
    normals : Vertices
  end

  union ShapeData
    circle : Circle
    polygon : Polygon
  end

  struct Shape
    type : ShapeType
    material : Material
    is_rect : Bool
    area : LibC::Float
    shape_data : ShapeData
  end

  struct MotionData
    mass : LibC::Float
    inverse_mass : LibC::Float
    inertia : LibC::Float
    inverse_inertia : LibC::Float
    velocity : LibRaylib::Vector
    angular_velocity : LibC::Float
    gravity_Scale : LibC::Float
    force : LibRaylib::Vector
    torque : LibC::Float
  end

  struct Body
    type : BodyType
    flags : BodyFlags
    material : Material
    motion : MotionData
    shape : Shape
    aabb : LibRaylib::Rectangle
    data : Void*
  end

  struct SolverCache
    bodies : StaticArray(Body, 2)
  end

  struct Collision
    check : Bool
    cache : SolverCache
    direction : LibRaylib::Vector2
    points : StaticArray(LibRaylib::Vector2, 2)
    points : StaticArray(LibC::Float, 2)
    direction : LibC::Int
  end

  alias CollisionCallback = Collision* ->

  struct CollisionHandler
    pre_solve : CollisionCallback
    post_solve : CollisionCallback
  end

  struct Ray
    origin : LibRaylib::Vector2
    direction : LibRaylib::Vector2
    max_distance : LibC::Float
    closest : Bool
  end

  union ShapeBody
    shape : Shape*
    body : Body*
  end

  struct RaycastHit
    check : Bool
    shape_body : ShapeBody
    point : LibRaylib::Vector2
    normal : LibRaylib::Vector2
    distance : LibC::Float
    inside : Bool
  end

  struct SpatialEntry
    key : LibC::Int
    values : LibC::Int*
  end

  struct SpatialHash
    bounds : LibRaylib::Rectangle
    cell_size : LibC::Float
    inverse_cell_size : LibC::Float
    map : SpatialEntry*
  end

  struct World
    gravity : LibRaylib::Vector2
    bodies : Body**
    hash : SpatialHash*
    collisions : Collisions*
    handler : CollisionHandler
    accumulator : LibC::Double
    timestamp : LibC::Double
    queries : LibC::Int*
  end

  # Broadphase
  fun create_spatial_hash = frCreateSpatialHash(bounds : LibRaylib::Rectangle, cell_size : LibC::Float) : SpatialHash*
  fun release_spatial_hash = frReleaseSpatialHash(hash : SpatialHash*)
  fun add_to_spatial_hash = frAddToSpatialHash(hash : SpatialHash*, rec : LibRaylib::Rectangle, value : LibC::Int)
  fun clear_spatial_hash = frClearSpatialHash(hash : SpatialHash*)
  fun remove_from_spatial_hash = frRemoveFromSpatialHash(hash : SpatialHash*, key : LibC::Int)
  fun query_spatial_hash = frQuerySpatialHash(hash : SpatialHash*, rec : LibRaylib::Rectangle, queries : LibC::Int**)
  fun get_spatial_hash_bounds = frGetSpatialHashBounds(hash : SpatialHash*) : LibRaylib::Rectangle
  fun get_spatial_hash_cell_size = frGetSpatialHashCellSize(hash : SpatialHash*) : LibC::Float
  fun set_spatial_hash_bounds = frSetSpatialHashBounds(hash : SpatialHash*,  bounds : LibRaylib::Rectangle)
  fun set_spatial_hash_cell_size = frSetSpatialHashCellSize(hash : SpatialHash*, cell_size : LibC::Float)
  fun compute_spatial_hash_key = frComputeSpatialHashKey(hash : SpatialHash*, v : LibRaylib::Vector2) : LibC::Int

  # Collision
  fun compute_shape_collision = frComputeShapeCollision(s1 : Shape*, tx1 : Transform, s2 : Shape*, tx2 : Transform) : Collision
  fun compute_body_collision = frComputeBodyCollision(b1 : Body*, b2 : Body*) : Collision
  fun compute_shape_raycast = frComputeBodyRaycast(s : Shape*, tx : Transform, ray : Ray) : RaycastHit
  fun draw_arrow = frDrawArrow(p1 : LibRaylib::Vector2, p2 : LibRaylib::Vector2, thick : LibC::Float, color : LibRaylib::Color)
  fun draw_body = frDrawBody(b : Body*, color : LibRaylib::Color)
  fun draw_body_lines = frDrawBodyLines(b : Body*, thick : LibC::Float, color : LibRaylib::Color)
  fun draw_body_aabb = frDrawBodyAABB(b : Body*, thick : LibC::Float, color : LibRaylib::Color)
  fun draw_body_properties = frDrawBodyProperties(b : Body*, color : LibRaylib::Color)
  fun draw_spatial_hash = frDrawSpatialHash(hm : SpatialHash*, thick : LibC::Float, color : LibRaylib::Color)
  fun get_random_color = frGetRandomColor : LibRaylib::Color

  # Dynamics
  fun create_body = frCreateBody(type : BodyType, flags : BodyFlags, p : LibRaylib::Vector2) : Body*
  fun create_body_from_shape = frCreateBodyFromShape(type : BodyType, flags : BodyFlags, p : LibRaylib::Vector2, s : Shape*) : Body*
  fun release_body = frReleaseBody(b : Body*)
  fun attach_shape_to_body = frAttachShapeToBody(b : Body*, s : Shape*)
  fun detach_shape_from_body = frAttachShapeToBody(b : Body*, s : Shape*)
  fun get_body_struct_size = frGetBodyStructSize : LibC::UInt
  fun get_body_type = frGetBodyType(b : Body*) : BodyType
  fun get_body_flags = frGetBodyFlags(b : Body*) : BodyFlags
  fun get_body_material = frGetBodyMaterial(b : Body*) : Material
  fun get_body_mass = frGetBodyMass(b : Body*) : LibC::Float
  fun get_body_inverse_mass = frGetBodyInverseMass(b : Body*) : LibC::Float
  fun get_body_intertia = frGetBodyInertia(b : Body*) : LibC::Float
  fun get_body_inverse_intertia = frGetBodyInverseInertia(b : Body*) : LibC::Float
  fun get_body_velocity = frGetBodyVelocity(b : Body*) : LibRaylib::Vector2
  fun get_body_angular_velocity = frGetBodyAngularVelocity(b : Body*) : LibC::Float
  fun get_body_gravity_scale = frGetBodyGravityScale(b : Body*) : LibC::Float
  fun get_body_transform = frGetBodyTransform(b : Body*) : Transform
  fun get_body_gravity_scale = frGetBodyGravityScale(b : Body*) : LibC::Float
  fun get_body_position = frGetBodyPosition(b : Body*) : LibRaylib::Vector2
  fun get_body_rotation = frGetBodyRotation(b : Body*) : LibC::Float
  fun get_body_shape = frGetBodyShape(b : Body*) : Shape*
  fun get_body_aabb = frGetBodyAABB(b : Body*) : LibRaylib::Rectangle
  fun get_body_user_data = frGetBodyUserData(b : Body*) : Void*
  fun get_local_point = frGetLocalPoint(b : Body*, p : LibRaylib::Vector2) : LibRaylib::Vector2
  fun get_world_point = frGetWorldPoint(b : Body*, p : LibRaylib::Vector2) : LibRaylib::Vector2
  fun set_body_type = frSetBodyType(b : Body*, type : BodyType)
  fun set_body_flags = frSetBodyFlags(b : Body*, type : BodyFlags)
  fun set_body_velocity = frSetBodyVelocity(b : Body*, v : LibRaylib::Vector2) : LibRaylib::Vector2
  fun set_body_angular_velocity = frSetBodyAngularVelocity(b : Body*, a : LibC::Double)
  fun set_body_gravity_scale = frSetBodyGravityScale(b : Body*, scale : LibC::Float)
  fun set_body_transform = frSetBodyTransform(b : Body*, tx : Transform)
  fun set_body_position = frSetBodyPosition(b : Body*, p : LibRaylib::Vector2)
  fun set_body_rotation = frSetBodyRotation(b : Body*, rotation : LibC::Float)
  fun set_body_user_data = frSetBodyUserData(b : Body*, data : Void*)
  fun clear_body_forces = frClearBodyForces(b : Body*)
  fun apply_gravity = frApplyGravity(b : Body*, gravity : LibRaylib::Vector2)
  fun apply_impulse = frApplyImpulse(b : Body*, impulse : LibRaylib::Vector2)
  fun apply_torque_impulse = frApplyTorqueImpulse(b : Body*, p : LibRaylib::Vector2, impulse : LibRaylib::Vector2)
  fun integrate_for_body_position = frIntegrateForBodyPosition(b : Body*, dt : LibC::Double)
  fun integrate_for_body_velocities = frIntegrateForBodyVelocities(b : Body*, dt : LibC::Double)
  fun resolve_collision = frResolveCollision(collision : Collision*)
  fun correct_body_positions = frCorrectBodyPositions(collision : Collision*, inverse_dt : LibC::Float)

  # Geometry
  fun create_circle = frCreateCircle(material : Material, radius : LibC::Float) : Shape*
  fun create_rectangle = frCreateRectangle(material : Material, width : LibC::Float, height : LibC::Float) : Shape*
  fun create_polygon = frCreatePolygon(material : Material, vertices : Vertices) : Shape*
  fun create_shape = frCreateShape : Shape*
  fun clone_shape = frCloneShape(s : Shape*) : Shape*
  fun release_shape = frReleaseShape(s : Shape*)
  fun get_shape_struct_size = frGetShapeStructSize : LibC::UInt
  fun get_shape_type = frGetShapeType(s : Shape*) : ShapeType
  fun get_shape_material = frGetShapeMaterial(s : Shape*) : Material
  fun get_shape_area = frGetShapeArea(s : Shape*) : LibC::Float
  fun get_shape_mass = frGetShapeMass(s : Shape*) : LibC::Float
  fun get_shape_intertia = frGetShapeInertia(s : Shape*) : LibC::Float
  fun get_shape_aabb = frGetShapeAABB(s : Shape*, tx : Transform) : LibRaylib::Rectangle
  fun get_circle_radius = frGetCircleRadius(s : Shape*) : LibC::Float
  fun get_rectangle_dimensions = frGetRectangleDimensions(s : Shape*) : LibRaylib::Vector2
  fun get_polygon_vertex = frGetPolygonVertex(s : Shape*, index : LibC::Int) : LibRaylib::Vector2
  fun get_polygon_normal = frGetPolygonNormal(s : Shape*, index : LibC::Int) : LibRaylib::Vector2
  fun get_polygon_vertices = frGetPolygonVertices(s : Shape*, index : LibC::Int) : Vertices
  fun get_polygon_normals = frGetPolygonNormals(s : Shape*) : Vertices
  fun is_shape_rectangle? = frIsShapeRectangle(s : Shape*) : Bool
  fun set_circle_radius = frGetCircleRadius(s : Shape*, radius : LibC::Float
  fun set_rectangle_dimensions = frSetRectangleDimensions(s : Shape*, wh : LibRaylib::Vector2)
  fun set_polygon_vertices = frSetPolygonVertices(s : Shape*, vertices : Vertices)
  fun set_shape_material = frSetShapeMaterial(s : Shape*, material : Material)
  fun set_shape_type = frSetShapeType(s : Shape*, type : ShapeType)
  fun shape_contains_point = frShapeContainsPoint(s : Shape*, tx : Transform, p : LibRaylib::Vector2)

  # Timer
  fun init_clock = frInitClock
  fun get_current_time  = frGetCurrentTime : LibC::Double
  fun get_time_difference  = frGetTimeDifference(new_time : LibC::Double, old_time : LibC::Double) : LibC::Double
  fun get_time_since = frGetTimeSince(old_time : LibC::Double) : LibC::Double
  fun normalize_angle = frNormalizeAngle(angle : LibC::Float, center : LibC::Float) : LibC::Float
  fun number_approx_equals? = frNumberApproxEquals(f1 : LibC::Float, f2 : LibC::Float) : Bool

  # World
  fun create_world = frCreateWorld(gravity : LibRaylib::Vector2, bounds : LibRaylib::Rectangle) : World*
  fun release_world = frReleaseWorld(world : World*)
  fun add_to_world = frAddToWorld(world : World*, b : Body*) : Bool
  fun clear_world = frClearWorld(world : World*)
  fun remove_from_world = frRemoveFromWorld(world : World*, b : Body*)
  fun get_world_struct_size = frGetWorldStructSize : LibC::UInt
  fun get_world_body = frGetWorldBody(world : World*, index : LibC::Int) : Body*
  fun get_world_collision_handler = frGetWorldCollisionHandler(world : World*) : CollisionHandler
  fun get_world_body_count = frGetWorldBodyCount(world : World*) : LibC::Int
  fun get_world_bounds = frGetWorldBounds(world : World*) : LibRaylib::Rectangle
  fun get_world_spatial_hash = frGetWorldSpatialHash(world : World*) : SpatialHash*
  fun get_world_gravity = frGetWorldGravity(world : World*) : LibRaylib::Vector2
  fun in_world_bounds? = frIsInWorldBounds(world : World*, b : Body*) : Bool
  fun set_world_bounds = frSetWorldBounds(world : World*, bounds : LibRaylib::Rectangle)
  fun set_world_gravity = frSetWorldGravity(world : World*, gravity : LibRaylib::Vector2)
  fun simulate_world = frSimulateWorld(world : World*, dt : LibC::Double)
  fun query_world_spatial_hash = frQueryWorldSpatialHash(world : World*, bounds : LibRaylib::Rectangle, bodies : Body**) : LibC::Int
  fun compute_world_raycast = frComputeWorldRaycast(world : World*, ray : Ray, hits : RaycastHit*) : LibC::Int
end