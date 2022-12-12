@[Flags]
enum Wireland::Direction
  Up    = 1
  Left  = 2
  Down  = 4
  Right = 8

  def rotate_cw
    dir = self.value
    dir = dir >> 1
    dir = 8 if dir == 0
    Wireland::Direction.new dir
  end

  def rotate_ccw
    dir = self.value
    dir = dir << 1
    dir = 1 if dir > 8
    Wireland::Direction.new dir
  end

  def flip
    rotate_ccw.rotate_ccw
  end
end
