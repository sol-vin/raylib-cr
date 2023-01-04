module Wireland::IO
  @on = false

  def on?
    @on
  end

  def off?
    !@on
  end

  def on
    @on = true
  end

  def off
    @on = false
  end

  def toggle
    @on = !@on
  end

  def color : R::Color
    R::Color.new
  end
end

class Wireland::Component::InputOn < Wireland::Component
  def self.allow_adjacent?
    true
  end

  include Wireland::IO

  @on = true
  
  # def on_tick
  #   if on?
  #     parent.active_pulse(id, connects)
  #   end
  # end

  def color
    if on?
      parent.pallette.input_on
    else
      parent.pallette.input_off
    end
  end
end

class Wireland::Component::InputOff < Wireland::Component
  def self.allow_adjacent?
    true
  end

  include Wireland::IO

  # def on_tick
  #   if on?
  #     parent.active_pulse(id, connects)
  #   end
  # end

  
  def color
    if on?
      parent.pallette.input_on
    else
      parent.pallette.input_off
    end
  end
end

class Wireland::Component::InputToggleOn < Wireland::Component
  def self.allow_adjacent?
    true
  end

  include Wireland::IO

  @on = true 
  
  # def on_tick
  #   if on?
  #     parent.active_pulse(id, connects)
  #   end
  # end

  
  def color
    if on?
      parent.pallette.input_toggle_on
    else
      parent.pallette.input_toggle_off
    end
  end
end

class Wireland::Component::InputToggleOff < Wireland::Component
  def self.allow_adjacent?
    true
  end

  include Wireland::IO
  
  # def on_tick
  #   if on?
  #     parent.active_pulse(id, connects)
  #   end
  # end

  def color
    if on?
      parent.pallette.input_toggle_on
    else
      parent.pallette.input_toggle_off
    end
  end
end

class Wireland::Component::OutputOn < Wireland::Component
  def self.allow_adjacent?
    true
  end

  include Wireland::IO

  def on_tick
    if high?
      on
    else
      off
    end
  end

  def color
    if on?
      parent.pallette.output_off
    else
      parent.pallette.output_on
    end
  end
end

class Wireland::Component::OutputOff < Wireland::Component
  def self.allow_adjacent?
    true
  end

  include Wireland::IO

  def on_tick
    if high?
      on
    else
      off
    end
  end

  def color
    if on?
      parent.pallette.output_on
    else
      parent.pallette.output_off
    end
  end
end
