 # A wire instruction like WIRE, ALTWIRE, JOIN, ETC
class Wireland::Component
  alias R = Raylib
  alias Point = NamedTuple(x: Int32, y: Int32)


  # Holds a list of all classes inheriting this class
  class_getter all : Array(Wireland::Component.class) = [] of Wireland::Component.class
  # Empty list for easier definition for components
  class_getter none : Array(Wireland::Component.class) = [] of Wireland::Component.class

  # Adds all inheriting types to the class list
  macro inherited
    Wireland::Component.all << {{@type.id}}
  end

  # Color of the component
  class_property color : R::Color = R::Color.new

  # Should we connect adjacently to another component of the same type to create a part.
  def self.allow_adjacent?
    false
  end

  # Should we connect diagonally to another component.
  def self.allow_diags?
    false
  end

  # Does this component delay execution?
  def self.active?
    false
  end

  def self.passive?
    !active?
  end

  # List of `Component` classes that this component should not pulse out to.
  def self.output_whitelist : Array(self.class)
    Wireland::Component.all.reject(Wireland::Component::DiodeOut, Wireland::Component::NotOut)
  end

  # Link to the parent circuit
  getter parent : Wireland::Circuit

  # What this component is connected out to.
  property connects = [] of UInt64
  
  # The list of pulses incoming to this component from which component id.
  property pulses = [] of UInt64

  # The id of this component
  property id : UInt64 = 0_u64

  # Can this component conduct in and out? Used by relay poles to turn off and on a component.
  property? conductive : Bool = true

  # List of points on the original image where this component is.
  property xy = [] of Point

  def initialize(@parent : Wireland::Circuit)
  end

  def setup
  end

  # Has this component been pulsed this tick?
  def high?
    pulses.size > 0
  end

  # Has this component been pulsed this tick?
  def low?
    pulses.size == 0
  end

  # Was this component pulsed by a component with `id`?
  def pulsed_by?(id)
    !!pulses[id]?
  end

  def pulse_out
    connects.each do |com_id|
      # Pulse our connecting parts, but only if we haven't pulsed it already.
      circuit[com_id].pulse_in(self.id) unless pulsed_by?(com_id) || has_pulsed?(com_id)
    end
  end

  def pulse_out(to_id : UInt64)
    circuit[to_id].pulse_in(self.id) unless pulsed_by?(com_id) || has_pulsed?(com_id)
  end

  def pulse_in(from_id : UInt64)
    if from_id == id
      raise "#{self.id} was pulsed by #{from_id} but it cannot pulse itself."
    end

    if conductive?
      # Add pulse to list of pulses in.
      pulses << from_id
      # Run the on_new_pulse event
      on_pulse(self, from_id)
    end
  end
  
  def terminal?
    connects_out.size == 0
  end

  # Events
  # What to do when getting a pulse every tick
  def on_high
  end

  # What to do when not getting a pulse every tick
  def on_low
  end

  # Used by active components to handle end of tick behavior. 
  def on_tick
  end

  # What should be done when this part receives a new charge from a new source
  def on_pulse(from_id : UInt64)
    pulse_out unless active? || pulses.size > 1
  end
end