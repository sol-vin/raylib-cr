class Wireland::Component::NotIn < Wireland::Component
  def self.allow_adjacent?
    true
  end

  def self.output_whitelist : Array(Wireland::Component.class)
    [Wireland::Component::NotOut] of Wireland::Component.class
  end
end

class Wireland::Component::NotOut < Wireland::Component
  def self.active?
    true
  end

  def self.allow_adjacent?
    true
  end

  def self.output_whitelist
    [super.reject { |c| c == Wireland::Component::NotIn}, Wireland::Component::Buffer].flatten
  end

  def on_tick
    if low?
      parent.active_pulse(id, connects)
    end
  end
end
