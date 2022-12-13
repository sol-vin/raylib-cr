class Wireland::Component::DiodeIn < Wireland::Component
  def self.allow_adjacent?
    true
  end

  def self.output_whitelist : Array(Wireland::Component.class)
    [Wireland::Component::DiodeOut, Wireland::Component::Start] of Wireland::Component.class
  end
end

class Wireland::Component::DiodeOut < Wireland::Component
  def self.allow_adjacent?
    true
  end

  def self.output_whitelist : Array(Wireland::Component.class)
    Wireland::Component.all.reject { |c| c == Wireland::Component::Start || c == Wireland::Component::DiodeIn || c == Wireland::Component::NotOut || c == self }
  end
end
