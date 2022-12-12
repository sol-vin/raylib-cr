require "./spec_helper"

describe Wireland::Direction do
  it "should be able to rotate directions properly" do
    Wireland::Direction::Up.flip.should eq Wireland::Direction::Down
    Wireland::Direction::Down.flip.should eq Wireland::Direction::Up
    Wireland::Direction::Left.flip.should eq Wireland::Direction::Right
    Wireland::Direction::Right.flip.should eq Wireland::Direction::Left

    Wireland::Direction::Up.rotate_cw.should eq Wireland::Direction::Right
    Wireland::Direction::Right.rotate_cw.should eq Wireland::Direction::Down
    Wireland::Direction::Down.rotate_cw.should eq Wireland::Direction::Left
    Wireland::Direction::Left.rotate_cw.should eq Wireland::Direction::Up

    Wireland::Direction::Up.rotate_ccw.should eq Wireland::Direction::Left
    Wireland::Direction::Left.rotate_ccw.should eq Wireland::Direction::Down
    Wireland::Direction::Down.rotate_ccw.should eq Wireland::Direction::Right
    Wireland::Direction::Right.rotate_ccw.should eq Wireland::Direction::Up
  end
end
