class Wireland::Component::RelaySwitch < Wireland::Component
  def self.allow_adjacent?
    true
  end

  def self.output_whitelist : Array(Wireland::Component.class, self)
    Wireland::Component.none
  end

  getter poles = [] of Wireland::RelayPole

  def on_high
    poles.each do |pole|
      pole.on
    end
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