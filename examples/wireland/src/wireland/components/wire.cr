class Wireland::Component::Wire < Wireland::Component
  def self.allow_diags?
    true
  end

  def self.allow_adjacent?
    true
  end

  
  def self.output_whitelist : Array(Wireland::Component.class)
    Wireland::Component.all.reject(Wireland::Component::AltWire, self)
  end
end

class Wireland::Component::AltWire < Wireland::Component
  def self.allow_diags?
    true
  end

  def self.allow_adjacent?
    true
  end

  
  def self.output_whitelist : Array(Wireland::Component.class)
    Wireland::Component.all.reject(Wireland::Component::Wire, self)
  end
end