module Wireland::IO
  def on?
    false
  end

  def off?
    false
  end

  def on
  end

  def off
  end

  def color : R::Color
    R::Color.new
  end
end

class Wireland::Component::InputOn < Wireland::Component
  def self.allow_adjacent?
    true
  end

  include Wireland::IO

  def on_tick
    if on?
      pulse_out
    end
  end
end

class Wireland::Component::InputOff < Wireland::Component
  def self.allow_adjacent?
    true
  end
end

class Wireland::Component::InputToggleOn < Wireland::Component
  def self.allow_adjacent?
    true
  end
end

class Wireland::Component::InputToggleOff < Wireland::Component
  def self.allow_adjacent?
    true
  end
end

class Wireland::Component::OutputOn < Wireland::Component
  def self.allow_adjacent?
    true
  end
end

class Wireland::Component::OutputOff < Wireland::Component
  def self.allow_adjacent?
    true
  end
end
