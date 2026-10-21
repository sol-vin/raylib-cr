require "./spec_helper"

describe "Raymath" do
  it "binds representative additions" do
    x = Raylib::Vector2.new(x: 1, y: 0)
    y = Raylib::Vector2.new(x: 0, y: 1)

    Raymath.vector2_cross_product(x, y).should eq(1.0)
    Raymath.vector4_zero.should eq(Raylib::Vector4.new)
    typeof(Raymath.matrix_compose(
      Raylib::Vector3.new,
      Raylib::Quaternion.new,
      Raylib::Vector3.new
    )).should eq(Raylib::Matrix)
  end

  it "provides typed convenience methods" do
    v3 = Raylib::Vector3.new(x: 1, y: 0, z: 0)
    v3.length.should eq(1.0)
    typeof(v3.move_towards(v3, 1.0)).should eq(Raylib::Vector3)

    matrix = Raylib::Matrix.identity
    quaternion = Raylib::Quaternion.identity
    typeof(matrix * 2.0).should eq(Raylib::Matrix)
    typeof(quaternion.cubic_hermite(quaternion, quaternion, quaternion, 0.5)).should eq(Raylib::Quaternion)
    quaternion.equals?(quaternion).should be_true
  end
end
