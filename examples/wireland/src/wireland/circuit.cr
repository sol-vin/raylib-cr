# The whole simulated program
class Wireland::Circuit
  alias Point = NamedTuple(x: Int32, y: Int32)
  alias WC = Wireland::Component
  alias R = Raylib

  def load(image : R::Image, pallette : Wireland::Pallette = Wireland::Pallette::DEFAULT) : Array(WC)
    raise "No file" if image.width <= 0

    pallette.load_into_components

    # List of pixels that are in our pallette
    component_points = {} of WC.class => Array(Point)
    WC.all.each { |c| component_points[c] = [] of Point }
    image.width.times do |x|
      image.height.times do |y|
        color = R.get_image_color(image, x, y)
        if component = WC.all.find { |c| c.color == color }
          component_points[component] << {x: x, y: y}
        end
      end
    end

    components = [] of WC

    id = 0_u64
    # Go through each component point
    component_points.each do |component_class, pixel_xy|
      pixel_xy.each do |xy|
        # Ignore this point if it already has a component
        next if components.any?(&.xy.any?(&.==(xy)))
        # Does this component not connect itself as a shape? Things like Crossing, Tunnel.
        if !component_class.allow_adjacent? && !component_class.allow_diags?
          component = component_class.new self
          component.xy = [xy]
          component.id = id
          components << component
          id += 1
        else
          component = component_class.new self
          component.xy = _get_component_shape(component_points, component_class, xy)
          component.id = id
          components << component
          id += 1
        end
      end
    end

    adjacent = [
      {x: 0, y: -1},
      {x: -1, y: 0},
      {x: 0, y: 1},
      {x: 1, y: 0},
    ]

    # Connect each of the components
    components.each do |component|
      # Select only components that are valid output destinations
      valid_components = components.select { |c| component.class.output_whitelist.includes? c.class }
      valid_components.each do |vc|
        # Is this component a neighbor for any point on our main component
        is_vc_neighbors = component.xy.any? do |c_point|
          vc.xy.any? do |vc_point|
            adjacent.any? { |a_p| {x: c_point[:x] + a_p[:x], y: c_point[:y] + a_p[:y]} == vc_point }
          end
        end

        component.connects << vc.id if is_vc_neighbors && vc.id != component.id
      end
    end
    @last_id = components.sort { |a,b| b.id <=> a.id }[0].id
    # Setup all the components. Cross, Tunnel, etc
    components
  end

  private def _get_tunnel_neighbors(component_points : Hash(WC.class, Array(Point)), xy : Point) : Array(Point)
    new_points = component_points[WC::Tunnel].select do |point|
      xy != point && (xy[:x] == point[:x] || xy[:y] == point[:y])
    end

    new_points
  end

  # Goes through the hash of component points to find the shape of an individual component from a starting point `xy`
  private def _get_component_shape(component_points : Hash(WC.class, Array(Point)), com : WC.class, xy : Point) : Array(Point)
    shape = [] of Point
    neighbors = [xy]
    shape.concat neighbors

    until neighbors.empty?
      shape.concat(
        neighbors = neighbors.map do |n|
          ns = _get_neighbors(component_points, com, n)
          ns.concat(_get_tunnel_neighbors(component_points, n)) if com == WC::Tunnel
          ns
        end.flatten.uniq!.reject do |n|
          shape.includes? n
        end
      )
    end

    shape
  end

  # Gets a list of all adjacent neighbors of type `com` around point `xy`
  private def _get_neighbors(component_points : Hash(WC.class, Array(Point)), com : WC.class, xy : Point) : Array(Point)
    neighbors = _make_neighborhood(xy, com)

    # If the neighbors are empty return nothing
    return [] of Point if neighbors.empty?

    component_points[com].select { |p| neighbors.includes? p }
  end

  # Creates a list of neighbor points around xy.
  private def _make_neighborhood(xy : Point, com : WC.class)
    diags = [
      {x: -1, y: -1},
      {x: -1, y: 1},
      {x: 1, y: -1},
      {x: 1, y: 1},
    ]

    adjacent = [
      {x: 0, y: -1},
      {x: -1, y: 0},
      {x: 0, y: 1},
      {x: 1, y: 0},
    ]

    r_points = [] of Point
    r_points += diags if com.allow_diags?
    r_points += adjacent if com.allow_adjacent?

    r_points.map { |r_p| {x: xy[:x] + r_p[:x], y: xy[:y] + r_p[:y]} }
  end

  # Palette of colors that will be loaded into our component classes.
  property pallette : Wireland::Pallette = Wireland::Pallette::DEFAULT

  # List of all components in this circuit
  property components = [] of WC
  # Number of ticks that have run since the circuit started.
  property ticks = 0_u128

  getter last_id = 0_u64

  # List of pulses that need to
  getter active_pulses = {} of UInt64 => Array(UInt64)

  def initialize
  end

  def initialize(filename : String, pallette_file : String)
    @pallette = Wireland::Pallette.new(pallette_file)
    image = R.load_image(filename)
    @components = load(image, @pallette)
    R.unload_image image
    components.each(&.setup)
    reset
  end

  def initialize(filename : String, @pallette : Wireland::Pallette = Wireland::Pallette::DEFAULT)
    image = R.load_image(filename)
    @components = load(image, @pallette)
    R.unload_image image
    components.each(&.setup)
    reset
  end

  def initialize(image : R::Image, @pallette : Wireland::Pallette = Wireland::Pallette::DEFAULT)
    @components = load(image, pallette)
    components.each(&.setup)
    reset
  end

  # Gets a component at index
  def [](index)
    components[index]
  end

  # Gets a component at index but with a question mark. :)
  def []?(index)
    components[index]?
  end

  # Queues up a list of active pulses for the next tick. Used by active components.
  def active_pulse(id, to : Array(UInt64))
    if active_pulses[id]?
      active_pulses[id].concat to
    else
      active_pulses[id] = to.dup
    end
  end

  # Queues up an active pulses for the next tick. Used by active components.
  def active_pulse(id, to : UInt64)
    if arr = active_pulses[id]?
      arr << to
    else
      active_pulses[id] = [to]
    end
  end

  def pulse_inputs
    inputs = components.select(&.is_a?(WC::InputOn | WC::InputOff | WC::InputToggleOn | WC::InputToggleOff)).map(&.as(Wireland::IO))
    inputs.select(&.on?).each { |i| active_pulse(i.id, i.connects) }
    off_inputs = inputs.select(&.off?).map(&.id)
    @active_pulses.reject!{|c| off_inputs.includes? c}
  end

  def pre_tick
    active_pulses.each do |from, pulses|
      pulses.each do |to|
        self[from].pulse_out to
      end
    end
  end

  def mid_tick
    active_pulses.clear

    components.each do |c|
      if c.high?
        c.on_high
      else
        c.on_low
      end
    end
  end

  def post_tick
    # Turn off all the poles, then flip them back on via on_tick where needed
    components.select(&.is_a?(Wireland::RelayPole)).map(&.as(Wireland::RelayPole)).each(&.off)
    components.select(&.is_a?(WC::InputOff)).map(&.as(WC::InputOff)).each(&.off)
    components.select(&.is_a?(WC::InputOn)).map(&.as(WC::InputOn)).each(&.off)
    components.each(&.on_tick)
    # Clear out all the pulses to start the next tick.
    components.each(&.pulses.clear)
  end

  def increase_ticks
    @ticks += 1
  end

  # Main logic route for the circuit
  def tick
    increase_ticks
    pulse_inputs
    pre_tick
    mid_tick
    post_tick
  end

  # Resets the circuit to tick 0
  def reset
    @ticks = 0
    active_pulses.clear
    components.select(&.is_a?(WC::Buffer)).each(&.setup)
    components.each(&.pulses.clear)
    components.select(&.is_a?(Wireland::RelayPole)).map(&.as(Wireland::RelayPole)).each(&.off)
    components.select(&.is_a?(WC::InputOff)).map(&.as(WC::InputOff)).each(&.off)
    components.select(&.is_a?(WC::InputOn)).map(&.as(WC::InputOn)).each(&.on)
    components.select(&.is_a?(WC::InputToggleOff)).map(&.as(WC::InputToggleOff)).each(&.off)
    components.select(&.is_a?(WC::InputToggleOn)).map(&.as(WC::InputToggleOn)).each(&.on)
    components.select(&.is_a?(WC::OutputOff)).map(&.as(WC::OutputOff)).each(&.off)
    components.select(&.is_a?(WC::OutputOn)).map(&.as(WC::OutputOn)).each(&.on)
    components.each(&.on_tick)
  end
end
