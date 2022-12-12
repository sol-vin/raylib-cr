class Wireland::Component::Pause < Wireland::Component
  def self.active?
    true
  end

  def self.allow_adjacent?
    true
  end

  def self.output_whitelist
    super.reject { |c| c == self }
  end

  def on_high
    state_queue << true
  end

  def on_low
    state_queue << false
  end

  def on_tick
    if state_queue.shift
      parent.active_pulse(id, connects.dup)
    end
  end

  getter state_queue = [] of Bool

  def setup
    @state_queue.clear
    xy.size.times { @state_queue << false }
  end
end
