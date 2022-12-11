class Wireland::Component::Start < Wireland::Component
  def self.allow_adjacent?
    true
  end
  
  def self.output_whitelist : Array(Wireland::Component.class)
    Wireland::Component.all.reject(self)
  end
end