class Wireland::Component::Join < Wireland::Component
  def self.allow_adjacent?
    true
  end

  def self.output_whitelist
    super.reject { |c| c == self }
  end
end
