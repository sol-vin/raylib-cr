class Wireland::Component::RelaySwitch < Wireland::Component
  def self.allow_adjacent?
    true
  end

  def self.output_whitelist : Array(Wireland::Component.class, self)
    Wireland::Component.none
  end

  getter poles = [] of Wireland::RelayPole

  def on_tick
    poles.each(&.on) if high?
  end

  def setup
    adjacent = [
      {x: 0, y: -1},
      {x: -1, y: 0},
      {x: 0, y: 1},
      {x: 1, y: 0},
    ]

    all_pole_components = parent.components.select(&.is_a?(Wireland::RelayPole)).map(&.as(Wireland::Component))

    neighbor_poles = all_pole_components.select do |pole_c|
      pole_c.shape.any? do |pole_xy|
        shape.any? do |xy|
          adjacent.any? do |a_point|
            pole_xy == {x: xy[:x] + a_point[:x], y: xy[:y] + a_point[:y]}
          end
        end
      end
    end

    @poles = neighbor_poles.map(&.as(Wireland::RelayPole))
  end
end

module Wireland::RelayPole
  def on
  end

  def off
  end
end

class Wireland::Component::RelayNOPole < Wireland::Component
  def self.allow_adjacent?
    true
  end

  def self.output_whitelist : Array(Wireland::Component.class)
    super.reject(Wireland::Component::RelaySwitch, self)
  end

  include Wireland::RelayPole  

  def on
    @conductive = true
  end

  def off
    @conductive = false
  end
end

class Wireland::Component::RelayNCPole < Wireland::Component
  def self.allow_adjacent?
    true
  end

  def self.output_whitelist : Array(Wireland::Component.class)
    super.reject(Wireland::Component::RelaySwitch, self)
  end

  include Wireland::RelayPole 

  def on
    @conductive = false
  end

  def off
    @conductive = true
  end
end