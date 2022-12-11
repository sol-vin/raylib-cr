class Wireland::Component::Pause < Wireland::Component::Active
  def self.allow_adjacent?
    true
  end

  def self.output_whitelist : Array(Wireland::Component.class)
    super.reject(self)
  end

  def on_high
    state_queue.queue true
  end

  def on_low
    state_queue.queue false
  end
  
  getter state_queue = [] of Bool

  def setup(size)
    @state_queue.clear
    shape.size.times { @state_queue << false }
  end
end