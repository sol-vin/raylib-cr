class Wireland::Component::Cross < Wireland::Component
  alias Point = NamedTuple(x: Int32, y: Int32)

  # This can technically only have a total of 4 directions 
  getter directions = {} of Wireland::Direction => UInt64

  def setup
    adjacent_directions = {
      Wireland::Direction::Up => {x: 0, y: -1},
      Wireland::Direction::Down => {x: 0, y: 1},
      Wireland::Direction::Left => {x: -1, y: 0},
      Wireland::Direction::Right => {x: 1, y: 0},
    } 
    connects.each do |c|
      direction = Wireland::Direction::None
      c.shape.each do |c_point|
        adjacent_directions.select { |d, a| shape.includes?({ x: c_point[:x] + a[:x], y: c_point[:y] + a[:y] }) }.keys.each do |d|
          direction |= d
        end
      end

      if direction != Wireland::Direction::None
        directions[direction] = c.id
      end
    end
  end

  # Special on_new_pulse to send the pulse to the correct place.
  def on_pulse(from_id : UInt64)
    directions[from_id].any? do |d|
      if d_id = directions.find {|k, _| k.includes? d.flip}
        pulse_out(d_id[1])
        true
      else
        false
      end
    end
  end
end