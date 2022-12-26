class Wireland::Component::DiodeIn < Wireland::Component
  def self.allow_adjacent?
    true
  end

  def self.output_whitelist : Array(Wireland::Component.class)
    [Wireland::Component::DiodeOut] of Wireland::Component.class
  end
end

class Wireland::Component::DiodeOut < Wireland::Component
  def self.allow_adjacent?
    true
  end

  def self.output_whitelist : Array(Wireland::Component.class)
    [super.reject {|c| c == Wireland::Component::DiodeIn}, Wireland::Component::Buffer].flatten
  end
end
