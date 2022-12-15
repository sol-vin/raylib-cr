class Wireland::Component::Switch < Wireland::Component
  def self.allow_adjacent?
    true
  end

  def self.output_whitelist : Array(Wireland::Component.class)
    Wireland::Component.none
  end

  getter poles : Array(Wireland::RelayPole) = [] of Wireland::RelayPole

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
      pole_c.xy.any? do |pole_xy|
        xy.any? do |xy|
          adjacent.any? do |a_point|
            pole_xy == {x: xy[:x] + a_point[:x], y: xy[:y] + a_point[:y]}
          end
        end
      end
    end

    neighbor_poles.each do |pole|
      @poles << pole.as(Wireland::RelayPole)
    end
  end
end

module Wireland::RelayPole
  def on
  end

  def off
  end
end

class Wireland::Component::NOPole < Wireland::Component
  def self.allow_adjacent?
    true
  end

  def self.output_whitelist
    super.reject { |c| c == Wireland::Component::Switch || c == self }
  end

  include Wireland::RelayPole

  def on
    @conductive = true
  end

  def off
    @conductive = false
  end
end

class Wireland::Component::NCPole < Wireland::Component
  def self.allow_adjacent?
    true
  end

  def self.output_whitelist
    super.reject { |c| c == Wireland::Component::Switch || c == self }
  end

  include Wireland::RelayPole

  def on
    @conductive = false
  end

  def off
    @conductive = true
  end
end
