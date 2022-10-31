@[Link("raylib")]
lib Raymath
  fun clamp = Clamp(value : LibC::Float, min : LibC::Float, max : LibC::Float) : LibC::Float
  fun lerp = Lerp(start : LibC::Float, finsh : LibC::Float, amount : LibC::Float) : LibC::Float
  fun normalize = Normalize(value : LibC::Float, start : LibC::Float, finish : LibC::Float) : LibC::Float
  fun remap = Remap(value : LibC::Float, input_start : LibC::Float, input_end : LibC::Float, output_start : LibC::Float, output_end : LibC::Float) : LibC::Float
  fun vector2_zero = Vector2Zero : Raylib::Vector2
  fun vector2_one = Vector2One : Raylib::Vector2
  fun vector2_add = Vector2Add(v1 : Raylib::Vector2, v2 : Raylib::Vector2) : Raylib::Vector2
  fun vector2_add_value = Vector2AddValue(v : Raylib::Vector2, add : LibC::Float) : Raylib::Vector2
  fun vector2_subtract = Vector2Subtract(v1 : Raylib::Vector2, v2 : Raylib::Vector2) : Raylib::Vector2
  fun vector2_subtract_value = Vector2SubtractValue(v : Raylib::Vector2, sub : LibC::Float) : Raylib::Vector2
  fun vector2_length = Vector2Length(v : Raylib::Vector2) : LibC::Float
  fun vector2_length_sqr = Vector2LengthSqr(v : Raylib::Vector2) : LibC::Float
  fun vector2_dot_product = Vector2DotProduct(v1 : Raylib::Vector2, v2 : Raylib::Vector2) : LibC::Float
  fun vector2_distance = Vector2Distance(v1 : Raylib::Vector2, v2 : Raylib::Vector2) : LibC::Float
  fun vector2_angle = Vector2Angle(v1 : Raylib::Vector2, v2 : Raylib::Vector2) : LibC::Float
  fun vector2_scale = Vector2Scale(v : Raylib::Vector2, scale : LibC::Float) : Raylib::Vector2
  fun vector2_multiply = Vector2Multiply(v1 : Raylib::Vector2, v2 : Raylib::Vector2) : Raylib::Vector2
  fun vector2_negate = Vector2Negate(v : Raylib::Vector2) : Raylib::Vector2
  fun vector2_divide = Vector2Divide(v1 : Raylib::Vector2, v2 : Raylib::Vector2) : Raylib::Vector2
  fun vector2_normalize = Vector2Normalize(v : Raylib::Vector2) : Raylib::Vector2
  fun vector2_transform = Vector2Transform(v : Raylib::Vector2, mat : Raylib::Matrix) : Raylib::Vector2
  fun vector2_lerp = Vector2Lerp(v1 : Raylib::Vector2, v2 : Raylib::Vector2, amount : LibC::Float) : Raylib::Vector2
  fun vector2_reflect = Vector2Reflect(v : Raylib::Vector2, normal : Raylib::Vector2) : Raylib::Vector2
  fun vector2_rotate = Vector2Rotate(v : Raylib::Vector2, angle : LibC::Float) : Raylib::Vector2
  fun vector2_move_towards = Vector2MoveTowards(v : Raylib::Vector2, target : Raylib::Vector2, max_distance : LibC::Float) : Raylib::Vector2
  fun vector3_zero = Vector3Zero : Raylib::Vector3
  fun vector3_one = Vector3One : Raylib::Vector3
  fun vector3_add = Vector3Add(v1 : Raylib::Vector3, v2 : Raylib::Vector3) : Raylib::Vector3
  fun vector3_add_value = Vector3AddValue(v : Raylib::Vector3, add : LibC::Float) : Raylib::Vector3
  fun vector3_subtract = Vector3Subtract(v1 : Raylib::Vector3, v2 : Raylib::Vector3) : Raylib::Vector3
  fun vector3_subtract_value = Vector3SubtractValue(v : Raylib::Vector3, sub : LibC::Float) : Raylib::Vector3
  fun vector3_scale = Vector3Scale(v : Raylib::Vector3, scalar : LibC::Float) : Raylib::Vector3
  fun vector3_multiply = Vector3Multiply(v1 : Raylib::Vector3, v2 : Raylib::Vector3) : Raylib::Vector3
  fun vector3_cross_product = Vector3CrossProduct(v1 : Raylib::Vector3, v2 : Raylib::Vector3) : Raylib::Vector3
  fun vector3_perpendicular = Vector3Perpendicular(v : Raylib::Vector3) : Raylib::Vector3
  fun vector3_length = Vector3Length(v : Raylib::Vector3) : LibC::Float
  fun vector3_length_sqr = Vector3LengthSqr(v : Raylib::Vector3) : LibC::Float
  fun vector3_dot_product = Vector3DotProduct(v1 : Raylib::Vector3, v2 : Raylib::Vector3) : LibC::Float
  fun vector3_distance = Vector3Distance(v1 : Raylib::Vector3, v2 : Raylib::Vector3) : LibC::Float
  fun vector3_angle = Vector3Angle(v1 : Raylib::Vector3, v2 : Raylib::Vector3) : LibC::Float
  fun vector3_negate = Vector3Negate(v : Raylib::Vector3) : Raylib::Vector3
  fun vector3_divide = Vector3Divide(v1 : Raylib::Vector3, v2 : Raylib::Vector3) : Raylib::Vector3
  fun vector3_normalize = Vector3Normalize(v : Raylib::Vector3) : Raylib::Vector3
  fun vector3_transform = Vector3Transform(v : Raylib::Vector3, mat : Raylib::Matrix) : Raylib::Vector3
  fun vector3_rotate_by_quaternion = Vector3RotateByQuaternion(v : Raylib::Vector3, q : Raylib::Quaternion) : Raylib::Vector3
  fun vector3_lerp = Vector3Lerp(v1 : Raylib::Vector3, v2 : Raylib::Vector3, amount : LibC::Float) : Raylib::Vector3
  fun vector3_reflect = Vector3Reflect(v : Raylib::Vector3, normal : Raylib::Vector3) : Raylib::Vector3
  fun vector3_min = Vector3Min(v1 : Raylib::Vector3, v2 : Raylib::Vector3) : Raylib::Vector3
  fun vector3_max = Vector3Max(v1 : Raylib::Vector3, v2 : Raylib::Vector3) : Raylib::Vector3
  fun vector3_barycenter = Vector3Barycenter(p : Raylib::Vector3, a : Raylib::Vector3, b : Raylib::Vector3, c : Raylib::Vector3) : Raylib::Vector3
  fun vector3_unproject = Vector3Unproject(source : Raylib::Vector3, projection : Raylib::Matrix, view : Raylib::Matrix) : Raylib::Vector3
  fun matrix_determinant = MatrixDeterminant(mat : Raylib::Matrix) : LibC::Float
  fun matrix_trace = MatrixTrace(mat : Raylib::Matrix) : LibC::Float
  fun matrix_transpose = MatrixTranspose(mat : Raylib::Matrix) : Raylib::Matrix
  fun matrix_invert = MatrixInvert(mat : Raylib::Matrix) : Raylib::Matrix
  fun matrix_normalize = MatrixNormalize(mat : Raylib::Matrix) : Raylib::Matrix
  fun matrix_identity = MatrixIdentity : Raylib::Matrix
  fun matrix_add = MatrixAdd(left : Raylib::Matrix, right : Raylib::Matrix) : Raylib::Matrix
  fun matrix_subtract = MatrixSubtract(left : Raylib::Matrix, right : Raylib::Matrix) : Raylib::Matrix
  fun matrix_multiply = MatrixMultiply(left : Raylib::Matrix, right : Raylib::Matrix) : Raylib::Matrix
  fun matrix_translate = MatrixTranslate(x : LibC::Float, y : LibC::Float, z : LibC::Float) : Raylib::Matrix
  fun matrix_rotate = MatrixRotate(axis : Raylib::Vector3, angle : LibC::Float) : Raylib::Matrix
  fun matrix_rotate_x = MatrixRotateX(angle : LibC::Float) : Raylib::Matrix
  fun matrix_rotate_y = MatrixRotateY(angle : LibC::Float) : Raylib::Matrix
  fun matrix_rotate_z = MatrixRotateZ(angle : LibC::Float) : Raylib::Matrix
  fun matrix_rotate_xyz = MatrixRotateXYZ(ang : Raylib::Vector3) : Raylib::Matrix
  fun matrix_rotate_zyx = MatrixRotateZYX(ang : Raylib::Vector3) : Raylib::Matrix
  fun matrix_scale = MatrixScale(x : LibC::Float, y : LibC::Float, z : LibC::Float) : Raylib::Matrix
  fun matrix_frustum = MatrixFrustum(left : LibC::Double, right : LibC::Double, bottom : LibC::Double, top : LibC::Double, near : LibC::Double, far : LibC::Double) : Raylib::Matrix
  fun matrix_perspective = MatrixPerspective(fovy : LibC::Double, aspect : LibC::Double, near : LibC::Double, far : LibC::Double) : Raylib::Matrix
  fun matrix_ortho = MatrixOrtho(left : LibC::Double, right : LibC::Double, bottom : LibC::Double, top : LibC::Double, near : LibC::Double, far : LibC::Double) : Raylib::Matrix
  fun matrix_look_at = MatrixLookAt(eye : Raylib::Vector3, target : Raylib::Vector3, up : Raylib::Vector3) : Raylib::Matrix
  fun quaternion_add = QuaternionAdd(q1 : Raylib::Quaternion, q2 : Raylib::Quaternion) : Raylib::Quaternion
  fun quaternion_add_value = QuaternionAddValue(q : Raylib::Quaternion, add : LibC::Float) : Raylib::Quaternion
  fun quaternion_subtract = QuaternionSubtract(q1 : Raylib::Quaternion, q2 : Raylib::Quaternion) : Raylib::Quaternion
  fun quaternion_subtract_value = QuaternionSubtractValue(q : Raylib::Quaternion, sub : LibC::Float) : Raylib::Quaternion
  fun quaternion_identity = QuaternionIdentity : Raylib::Quaternion
  fun quaternion_length = QuaternionLength(q : Raylib::Quaternion) : LibC::Float
  fun quaternion_normalize = QuaternionNormalize(q : Raylib::Quaternion) : Raylib::Quaternion
  fun quaternion_invert = QuaternionInvert(q : Raylib::Quaternion) : Raylib::Quaternion
  fun quaternion_multiply = QuaternionMultiply(q1 : Raylib::Quaternion, q2 : Raylib::Quaternion) : Raylib::Quaternion
  fun quaternion_scale = QuaternionScale(q : Raylib::Quaternion, mul : LibC::Float) : Raylib::Quaternion
  fun quaternion_divide = QuaternionDivide(q1 : Raylib::Quaternion, q2 : Raylib::Quaternion) : Raylib::Quaternion
  fun quaternion_lerp = QuaternionLerp(q1 : Raylib::Quaternion, q2 : Raylib::Quaternion, amount : LibC::Float) : Raylib::Quaternion
  fun quaternion_nlerp = QuaternionNlerp(q1 : Raylib::Quaternion, q2 : Raylib::Quaternion, amount : LibC::Float) : Raylib::Quaternion
  fun quaternion_slerp = QuaternionSlerp(q1 : Raylib::Quaternion, q2 : Raylib::Quaternion, amount : LibC::Float) : Raylib::Quaternion
  fun quaternion_from_vector3_to_vector3 = QuaternionFromVector3ToVector3(from : Raylib::Vector3, to : Raylib::Vector3) : Raylib::Quaternion
  fun quaternion_from_matrix = QuaternionFromMatrix(mat : Raylib::Matrix) : Raylib::Quaternion
  fun quaternion_to_matrix = QuaternionToMatrix(q : Raylib::Quaternion) : Raylib::Matrix
  fun quaternion_from_axis_angle = QuaternionFromAxisAngle(axis : Raylib::Vector3, angle : LibC::Float) : Raylib::Quaternion
  fun quaternion_from_euler = QuaternionFromEuler(pitch : LibC::Float, yaw : LibC::Float, roll : LibC::Float) : Raylib::Quaternion
  fun quaternion_to_euler = QuaternionToEuler(q : Raylib::Quaternion) : Raylib::Vector3
  fun quaternion_transform = QuaternionTransform(q : Raylib::Quaternion, mat : Raylib::Matrix) : Raylib::Quaternion

  # TODO: unbound functions, resolve manually
  # {'name': 'Vector3ToFloatV', 'description': '', 'returnType': 'float3', 'params': [{'type': 'Vector3', 'name': 'v'}]}
  # {'name': 'MatrixToFloatV', 'description': '', 'returnType': 'float16', 'params': [{'type': 'Matrix', 'name': 'mat'}]}

  fun vector3_ortho_normalize = Vector3OrthoNormalize(v1 : Raylib::Vector3*, v2 : Raylib::Vector3*)
  fun quaternion_to_axis_angle = QuaterntionToAxisAngle(q : Raylib::Quaternion, out_axis : Raylib::Vector3*, out_angle : LibC::Float*) \

end

struct Raylib::Vector2
  def self.zero : Raylib::Vector2
    Raymath.vector2_zero
  end

  def self.one : Raylib::Vector2
    Raymath.vector2_one
  end

  def add(v2 : Raylib::Vector2) : Raylib::Vector2
    Raymath.vector2_add(self, v2)
  end

  def add_value(add : Number) : Raylib::Vector2
    Raymath.vector2_add_value(self, add.to_f32)
  end

  def subtract(v2 : Raylib::Vector2) : Raylib::Vector2
    Raymath.vector2_subtract(self, v2)
  end

  def subtract_value(sub : Number) : Raylib::Vector2
    Raymath.vector2_subtract_value(self, sub.to_f32)
  end

  def length : LibC::Float
    Raymath.vector2_length(self)
  end

  def length_sqr : LibC::Float
    Raymath.vector2_length_sqr(self)
  end

  def dot_product(v2 : Raylib::Vector2) : LibC::Float
    Raymath.vector2_dot_product(self, v2)
  end

  def distance(v2 : Raylib::Vector2) : LibC::Float
    Raymath.vector2_distance(self, v2)
  end

  def angle(v2 : Raylib::Vector2) : LibC::Float
    Raymath.vector2_angle(self, v2)
  end

  def scale(scale : Number) : Raylib::Vector2
    Raymath.vector2_scale(self, scale.to_f32)
  end

  def multiply(v2 : Raylib::Vector2) : Raylib::Vector2
    Raymath.vector2_multiply(self, v2)
  end

  def negate : Raylib::Vector2
    Raymath.vector2_negate(self)
  end

  def divide(v2 : Raylib::Vector2) : Raylib::Vector2
    Raymath.vector2_divide(self, v2)
  end

  def normalize : Raylib::Vector2
    Raymath.vector2_normalize(self)
  end

  def transform(mat : Raylib::Matrix) : Raylib::Vector2
    Raymath.vector2_transform(self, mat)
  end

  def lerp(v2 : Raylib::Vector2, amount : Number) : Raylib::Vector2
    Raymath.vector2_lerp(self, v2, amount.to_f32)
  end

  def reflect(normal : Raylib::Vector2) : Raylib::Vector2
    Raymath.vector2_reflect(self, normal)
  end

  def rotate(angle : Number) : Raylib::Vector2
    Raymath.vector2_rotate(self, angle.to_f32)
  end

  def move_towards(target : Raylib::Vector2, max_distance : Number) : Raylib::Vector2
    Raymath.vector2_move_towards(self, target, max_distance.to_f32)
  end

  # Operators for convenience

  def +(other : self) : Raylib::Vector2
    self.add(other)
  end

  def +(other : Number) : Raylib::Vector2
    self.add_value(other)
  end

  def -(other : self) : Raylib::Vector2
    self.subtract(other)
  end

  def -(other : Number) : Raylib::Vector2
    self.subtract_value(other)
  end

  def *(other : self) : Raylib::Vector2
    self.multiply(other)
  end

  def *(other : Number) : Raylib::Vector2
    self.scale(other)
  end

  def /(other : self) : Raylib::Vector2
    self.divide(other)
  end

  def /(other : Number) : Raylib::Vector2
    self.scale((1/other).to_f32)
  end
end

struct Raylib::Vector3
  def self.zero : Raylib::Vector3
    Raymath.vector3_zero
  end

  def self.one : Raylib::Vector3
    Raymath.vector3_one
  end

  def add(v2 : Raylib::Vector3) : Raylib::Vector3
    Raymath.vector3_add(self, v2)
  end

  def add_value(add : Number) : Raylib::Vector3
    Raymath.vector3_add_value(self, add.to_f32)
  end

  def subtract(v2 : Raylib::Vector3) : Raylib::Vector3
    Raymath.vector3_subtract(self, v2)
  end

  def subtract_value(sub : Number) : Raylib::Vector3
    Raymath.vector3_subtract_value(self, sub.to_f32)
  end

  def scale(scalar : Number) : Raylib::Vector3
    Raymath.vector3_scale(self, scalar.to_f32)
  end

  def multiply(v2 : Raylib::Vector3) : Raylib::Vector3
    Raymath.vector3_multiply(self, v2)
  end

  def cross_product(v2 : Raylib::Vector3) : Raylib::Vector3
    Raymath.vector3_cross_product(self, v2)
  end

  def perpendicular : Raylib::Vector3
    Raymath.vector3_perpendicular(self)
  end

  def dot_product(v2 : Raylib::Vector3) : LibC::Float
    Raymath.vector3_dot_product(self, v2)
  end

  def distance(v2 : Raylib::Vector3) : LibC::Float
    Raymath.vector3_distance(self, v2)
  end

  def angle(v2 : Raylib::Vector3) : LibC::Float
    Raymath.vector3_angle(self, v2)
  end

  def negate : Raylib::Vector3
    Raymath.vector3_negate(self)
  end

  def divide(v2 : Raylib::Vector3) : Raylib::Vector3
    Raymath.vector3_divide(self, v2)
  end

  def normalize : Raylib::Vector3
    Raymath.vector3_normalize(self)
  end

  def transform(mat : Raylib::Matrix) : Raylib::Vector3
    Raymath.vector3_transform(self, mat)
  end

  def rotate_by_quaternion(q : Raylib::Quaternion) : Raylib::Vector3
    Raymath.vector3_rotate_by_quaternion(self, q)
  end

  def lerp(v2 : Raylib::Vector3, amount : Number) : Raylib::Vector3
    Raymath.vector3_lerp(self, v2, amount.to_f32)
  end

  def reflect(normal : Raylib::Vector3) : Raylib::Vector3
    Raymath.vector3_reflect(self, normal)
  end

  def min(v2 : Raylib::Vector3) : Raylib::Vector3
    Raymath.vector3_min(self, v2)
  end

  def max(v2 : Raylib::Vector3) : Raylib::Vector3
    Raymath.vector3_max(self, v2)
  end

  def barycenter(a : Raylib::Vector3, b : Raylib::Vector3, c : Raylib::Vector3) : Raylib::Vector3
    Raymath.vector3_barycenter(self, a, b, c)
  end

  def unproject(projection : Raylib::Matrix, view : Raylib::Matrix) : Raylib::Vector3
    Raymath.vector3_unproject(self, projection, view)
  end

  def self.rotate(axis : Raylib::Vector3, angle : Number) : Raylib::Matrix
    Raymath.matrix_rotate(axis, angle.to_f32)
  end

  def self.rotate_xyz(ang : Raylib::Vector3) : Raylib::Matrix
    Raymath.matrix_rotate_xyz(ang)
  end

  def self.rotate_zyx(ang : Raylib::Vector3) : Raylib::Matrix
    Raymath.matrix_rotate_zyx(ang)
  end

  def self.look_at(eye : Raylib::Vector3, target : Raylib::Vector3, up : Raylib::Vector3) : Raylib::Matrix
    Raymath.matrix_look_at(eye, target, up)
  end

  def self.from_vector3_to_vector3(from : Raylib::Vector3, to : Raylib::Vector3) : Raylib::Quaternion
    Raymath.quaternion_from_vector3_to_vector3(from, to)
  end

  def self.from_axis_angle(axis : Raylib::Vector3, angle : Number) : Raylib::Quaternion
    Raymath.quaternion_from_axis_angle(axis, angle.to_f32)
  end

  def to_euler : Raylib::Vector3
    Raymath.quaternion_to_euler(self)
  end

  # Operators for convenience

  def +(other : self) : Raylib::Vector3
    self.add(other)
  end

  def +(other : Number) : Raylib::Vector3
    self.add_value(other)
  end

  def -(other : self) : Raylib::Vector3
    self.subtract(other)
  end

  def -(other : Number) : Raylib::Vector3
    self.subtract_value(other)
  end

  def *(other : self) : Raylib::Vector3
    self.multiply(other)
  end

  def *(other : Number) : Raylib::Vector3
    self.scale(other)
  end

  def /(other : self) : Raylib::Vector3
    self.divide(other)
  end

  def /(other : Number) : Raylib::Vector3
    self.scale((1/other).to_f32)
  end
end

struct Raylib::Matrix
  def determinant : LibC::Float
    Raymath.matrix_determinant(self)
  end

  def trace : LibC::Float
    Raymath.matrix_trace(self)
  end

  def transpose : Raylib::Matrix
    Raymath.matrix_transpose(self)
  end

  def invert : Raylib::Matrix
    Raymath.matrix_invert(self)
  end

  def normalize : Raylib::Matrix
    Raymath.matrix_normalize(self)
  end

  def self.identity : Raylib::Matrix
    Raymath.matrix_identity
  end

  def add(right : Raylib::Matrix) : Raylib::Matrix
    Raymath.matrix_add(self, right)
  end

  def subtract(right : Raylib::Matrix) : Raylib::Matrix
    Raymath.matrix_subtract(self, right)
  end

  def multiply(right : Raylib::Matrix) : Raylib::Matrix
    Raymath.matrix_multiply(self, right)
  end

  def self.translate(x : Number, y : Number, z : Number) : Raylib::Matrix
    Raymath.matrix_translate(x.to_f32, y.to_f32, z.to_f32)
  end

  def self.rotate(axis : Raylib::Vector3, angle : Number) : Raylib::Matrix
    Raymath.matrix_rotate(axis, angle.to_f32)
  end

  def self.rotate_x(angle : Number) : Raylib::Matrix
    Raymath.matrix_rotate_x(angle.to_f32)
  end

  def self.rotate_y(angle : Number) : Raylib::Matrix
    Raymath.matrix_rotate_y(angle.to_f32)
  end

  def self.rotate_z(angle : Number) : Raylib::Matrix
    Raymath.matrix_rotate_z(angle.to_f32)
  end

  def self.rotate_xyz(ang : Raylib::Vector3) : Raylib::Matrix
    Raymath.matrix_rotate_xyz(ang)
  end

  def self.rotate_zyx(ang : Raylib::Vector3) : Raylib::Matrix
    Raymath.matrix_rotate_zyx(ang)
  end

  def self.scale(x : Number, y : Number, z : Number) : Raylib::Matrix
    Raymath.matrix_scale(x.to_f32, y.to_f32, z.to_f32)
  end

  def self.frustum(left : Number, right : Number, bottom : Number, top : Number, near : Number, far : Number) : Raylib::Matrix
    Raymath.matrix_frustum(left.to_f64, right.to_f64, bottom.to_f64, top.to_f64, near.to_f64, far.to_f64)
  end

  def self.perspective(fovy : Number, aspect : Number, near : Number, far : Number) : Raylib::Matrix
    Raymath.matrix_perspective(fovy.to_f64, aspect.to_f64, near.to_f64, far.to_f64)
  end

  def self.ortho(left : Number, right : Number, bottom : Number, top : Number, near : Number, far : Number) : Raylib::Matrix
    Raymath.matrix_ortho(left.to_f64, right.to_f64, bottom.to_f64, top.to_f64, near.to_f64, far.to_f64)
  end

  def self.look_at(eye : Raylib::Vector3, target : Raylib::Vector3, up : Raylib::Vector3) : Raylib::Matrix
    Raymath.matrix_look_at(eye, target, up)
  end

  def self.from_matrix(mat : Raylib::Matrix) : Raylib::Quaternion
    Raymath.quaternion_from_matrix(mat)
  end

  def to_matrix : Raylib::Matrix
    Raymath.quaternion_to_matrix(self)
  end

  # Operators for convenience

  def +(other : self) : Raylib::Matrix
    self.add(other)
  end

  def -(other : self) : Raylib::Matrix
    self.subtract(other)
  end

  def *(other : self) : Raylib::Matrix
    self.multiply(other)
  end
end

struct Raylib::Quaternion
  def add(q2 : Raylib::Quaternion) : Raylib::Quaternion
    Raymath.quaternion_add(self, q2)
  end

  def add_value(add : Number) : Raylib::Quaternion
    Raymath.quaternion_add_value(self, add.to_f32)
  end

  def subtract(q2 : Raylib::Quaternion) : Raylib::Quaternion
    Raymath.quaternion_subtract(self, q2)
  end

  def subtract_value(sub : Number) : Raylib::Quaternion
    Raymath.quaternion_subtract_value(self, sub.to_f32)
  end

  def self.identity : Raylib::Quaternion
    Raymath.quaternion_identity
  end

  def length : LibC::Float
    Raymath.quaternion_length(self)
  end

  def normalize : Raylib::Quaternion
    Raymath.quaternion_normalize(self)
  end

  def invert : Raylib::Quaternion
    Raymath.quaternion_invert(self)
  end

  def multiply(q2 : Raylib::Quaternion) : Raylib::Quaternion
    Raymath.quaternion_multiply(self, q2)
  end

  def scale(mul : Number) : Raylib::Quaternion
    Raymath.quaternion_scale(self, mul.to_f32)
  end

  def divide(q2 : Raylib::Quaternion) : Raylib::Quaternion
    Raymath.quaternion_divide(self, q2)
  end

  def lerp(q2 : Raylib::Quaternion, amount : Number) : Raylib::Quaternion
    Raymath.quaternion_lerp(self, q2, amount.to_f32)
  end

  def nlerp(q2 : Raylib::Quaternion, amount : Number) : Raylib::Quaternion
    Raymath.quaternion_nlerp(self, q2, amount.to_f32)
  end

  def slerp(q2 : Raylib::Quaternion, amount : Number) : Raylib::Quaternion
    Raymath.quaternion_slerp(self, q2, amount.to_f32)
  end

  def self.from_vector3_to_vector3(from : Raylib::Vector3, to : Raylib::Vector3) : Raylib::Quaternion
    Raymath.quaternion_from_vector3_to_vector3(from, to)
  end

  def self.from_matrix(mat : Raylib::Matrix) : Raylib::Quaternion
    Raymath.quaternion_from_matrix(mat)
  end

  def to_matrix : Raylib::Matrix
    Raymath.quaternion_to_matrix(self)
  end

  def self.from_axis_angle(axis : Raylib::Vector3, angle : Number) : Raylib::Quaternion
    Raymath.quaternion_from_axis_angle(axis, angle.to_f32)
  end

  def to_axis_angle(out_axis : Raylib::Vector3*, out_angle : LibC::Float*)
    Raymath.quaternion_to_axis_angle(self, out_axis, out_angle)
  end

  def self.from_euler(pitch : Number, yaw : Number, roll : Number) : Raylib::Quaternion
    Raymath.quaternion_from_euler(pitch.to_f32, yaw.to_f32, roll.to_f32)
  end

  def to_euler : Raylib::Vector3
    Raymath.quaternion_to_euler(self)
  end

  def transform(mat : Raylib::Matrix) : Raylib::Quaternion
    Raymath.quaternion_transform(self, mat)
  end

  # Operators for convenience

  def +(other : self) : Raylib::Quaternion
    self.add(other)
  end

  def +(other : Number) : Raylib::Quaternion
    self.add_value(other)
  end

  def -(other : self) : Raylib::Quaternion
    self.subtract(other)
  end

  def -(other : Number) : Raylib::Quaternion
    self.subtract_value(other)
  end

  def *(other : self) : Raylib::Quaternion
    self.multiply(other)
  end

  def *(other : Number) : Raylib::Quaternion
    self.scale(other)
  end

  def /(other : self) : Raylib::Quaternion
    self.divide(other)
  end

  def /(other : Number) : Raylib::Quaternion
    self.scale((1/other).to_f32)
  end
end
