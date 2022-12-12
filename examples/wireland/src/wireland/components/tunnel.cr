class Wireland::Component::Tunnel < Wireland::Component
  # This can technically only have a total of 4 directions 
  getter connect_directions = {} of Wireland::Direction => UInt64
  getter tunnel_directions = {} of Wireland::Direction => UInt64

  # Reject other tunnels from direct connection, we will allow it in tunnel_directions and directly pulse out instead.
  def self.output_whitelist
    super.reject(self)
  end

  # Special on_pulse to send the pulse to the correct place.
  def on_pulse(from_id : UInt64)
    # If a tunnel is sending us pulse, send the pulse out to all the connects
    if tunnel_directions.values.includes? from_id
      pulse_out
    # If a connection is sending is a pulse, send it to the proper tunnel
    elsif connect_directions.values.includes? from_id
      connect_directions[from_id].any? do |d|
        if d_id = tunnel_directions.find {|k, _| k.includes? d.flip}
          pulse_out(d_id[1])
          true
        else
          false
        end
      end
    end
  end

  def setup
    adjacent_directions = {
      Wireland::Direction::Up => {x: 0, y: -1},
      Wireland::Direction::Down => {x: 0, y: 1},
      Wireland::Direction::Left => {x: -1, y: 0},
      Wireland::Direction::Right => {x: 1, y: 0},
    }

    # Find which directions connects are connected to.
    connects.each do |c|
      direction = Wireland::Direction::None
      c.shape.each do |c_point|
        adjacent_directions.select { |d, a| xy[0] == { x: c_point[:x] + a[:x], y: c_point[:y] + a[:y] } }.keys.each do |d|
          direction |= d
        end
      end

      if direction != Wireland::Direction::None
        connect_directions[direction] = c.id
      end
    end

    other_tunnels = parent.components.select do |c| 
      c.is_a?(Wireland::Component::Tunnel) && 
      c.id != id && # This isn't us
      (c.xy[0][:x] == xy[0][:x] || c.xy[0][:y] == xy[0][:y]) # Check that this tunnel is on the same x or y axis
    end

    # Check which tunnels are the closest to this one for each direction
    left_tunnels = other_tunnels.select { |t| t.xy[:x] < xy[:x] }.sort.reverse
    right_tunnels = other_tunnels.select { |t| t.xy[:x] > xy[:x] }.sort
    up_tunnels = other_tunnels.select { |t| t.xy[:y] < xy[:y] }.sort.reverse
    down_tunnels = other_tunnels.select { |t| t.xy[:y] > xy[:y] }.sort

    # Set the tunnels to their direction
    if left_tunnel = left_tunnels[0]?
      tunnel_directions[Wireland::Direction::Left] = left_tunnel.id
    elsif right_tunnel = right_tunnels[0]?
      tunnel_directions[Wireland::Direction::Right] = right_tunnel.id
    elsif up_tunnel = up_tunnels[0]?
      tunnel_directions[Wireland::Direction::Up] = up_tunnel.id
    elsif down_tunnel = down_tunnels[0]?
      tunnel_directions[Wireland::Direction::Down] = down_tunnel.id
    end
  end
end