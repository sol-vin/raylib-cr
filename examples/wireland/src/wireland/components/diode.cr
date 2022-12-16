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
    super.reject do |c| 
      c == Wireland::Component::DiodeIn
    end
  end
end
