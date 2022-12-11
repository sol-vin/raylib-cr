class Wireland::Component::NotIn < Wireland::Component
  def self.allow_adjacent?
    true
  end

  def self.output_whitelist : Array(Wireland::Component.class)
    [Wireland::Component::NotOut]
  end
end

class Wireland::Component::NotOut < Wireland::Component::Active
  def self.allow_adjacent?
    true
  end

  def self.output_whitelist : Array(Wireland::Component.class)
    super
  end
end