class Wireland::Component::Wire < Wireland::Component
  def self.allow_diags?
    true
  end

  def self.allow_adjacent?
    true
  end

  def self.output_whitelist
    super.reject { |c| c == Wireland::Component::AltWire || c == self }
  end
end

class Wireland::Component::AltWire < Wireland::Component
  def self.allow_diags?
    true
  end

  def self.allow_adjacent?
    true
  end

  def self.output_whitelist
    super.reject { |c| c == Wireland::Component::Wire || c == self }
  end
end
