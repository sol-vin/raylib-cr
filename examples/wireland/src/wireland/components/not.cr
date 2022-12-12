class Wireland::Component::NotIn < Wireland::Component
  def self.allow_adjacent?
    true
  end

  def self.output_whitelist : Array(Wireland::Component.class)
    [Wireland::Component::NotOut]
  end
end

class Wireland::Component::NotOut < Wireland::Component
  def self.active?
    true
  end

  def self.allow_adjacent?
    true
  end

  def self.output_whitelist : Array(Wireland::Component.class)
    super.reject(Wireland::Component::NotIn, self)
  end

  def on_tick
    if low?
      parent.active_pulse(id, connects)
    end
  end
end