class Wireland::Component::DiodeIn < Wireland::Component
  def self.allow_adjacent?
    true
  end
  
  def self.output_whitelist : Array(Wireland::Component.class)
    [Wireland::Component::DiodeOut]
  end
end

class Wireland::Component::DiodeOut < Wireland::Component
  def self.allow_adjacent?
    true
  end

  def self.output_whitelist : Array(Wireland::Component.class)
    Wireland::Component.all.reject(Wireland::Component::NotOut, self)
  end
end