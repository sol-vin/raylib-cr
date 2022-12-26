class Wireland::Component::Buffer < Wireland::Component
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
    # Buffer can only accept pulses from something that is not also connected to it. (one way input only) This must be Start or DiodeOut or NotOut
    if pulses.size > 0
      state_queue << true
    else
      state_queue << false
    end
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
