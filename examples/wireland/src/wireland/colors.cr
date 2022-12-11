module Wireland::Pallette::DefaultColors
  PINK     = R::Color.new(r: 0xF6, g: 0x75, b: 0x7A, a: 0xFF)
  RED      = R::Color.new(r: 0xE4, g: 0x3B, b: 0x44, a: 0xFF)
  DARK_RED = R::Color.new(r: 0x9E, g: 0x28, b: 0x35, a: 0xFF)

  LIGHT_ORANGE = R::Color.new(r: 0xFF, g: 0xBF, b: 0x98, a: 0xFF)
  ORANGE       = R::Color.new(r: 0xF7, g: 0x76, b: 0x22, a: 0xFF)
  DARK_ORANGE  = R::Color.new(r: 0x84, g: 0x34, b: 0x00, a: 0xFF)

  LIGHT_YELLOW = R::Color.new(r: 0xFE, g: 0xF1, b: 0xA4, a: 0xFF)
  YELLOW       = R::Color.new(r: 0xFE, g: 0xE7, b: 0x61, a: 0xFF)
  DARK_YELLOW  = R::Color.new(r: 0x8C, g: 0x7F, b: 0x35, a: 0xFF)

  LIGHT_GREEN = R::Color.new(r: 0x99, g: 0xDA, b: 0x8B, a: 0xFF)
  GREEN       = R::Color.new(r: 0x63, g: 0xC7, b: 0x4D, a: 0xFF)
  DARK_GREEN  = R::Color.new(r: 0x26, g: 0x5C, b: 0x42, a: 0xFF)

  LIGHT_BLUE = R::Color.new(r: 0x2C, g: 0xE8, b: 0xF5, a: 0xFF)
  BLUE       = R::Color.new(r: 0x00, g: 0x95, b: 0xE9, a: 0xFF)
  DARK_BLUE  = R::Color.new(r: 0x12, g: 0x4E, b: 0x89, a: 0xFF)

  LIGHT_PURPLE = R::Color.new(r: 0xB5, g: 0x50, b: 0x88, a: 0xFF)
  PURPLE       = R::Color.new(r: 0x96, g: 0x00, b: 0xBE, a: 0xFF)
  DARK_PURPLE  = R::Color.new(r: 0x68, g: 0x38, b: 0x6C, a: 0xFF)

  LIGHT_BROWN = R::Color.new(r: 0xCA, g: 0x92, b: 0x7D, a: 0xFF)
  BROWN       = R::Color.new(r: 0xB8, g: 0x6F, b: 0x50, a: 0xFF)
  DARK_BROWN  = R::Color.new(r: 0x74, g: 0x3F, b: 0x39, a: 0xFF)

  WHITE = R::Color.new(r: 0xFF, g: 0xFF, b: 0xFF, a: 0xFF)
  GREY  = R::Color.new(r: 0xC0, g: 0xCB, b: 0xDC, a: 0xFF)
  BLACK = R::Color.new(r: 0x18, g: 0x14, b: 0x25, a: 0xFF)
end

struct Wireland::Pallette
  alias DC = Wireland::Pallette::DefaultColors
  alias WC = Wireland::Component
  alias R = Raylib

  DEFAULT = Wireland::Pallette.new(
    start: DC::LIGHT_GREEN,
    pause: DC::DARK_BLUE,
    wire: DC::WHITE,
    alt_wire: DC::GREY,
    join: DC::DARK_BROWN,
    cross: DC::BROWN,
    tunnel: DC::LIGHT_ORANGE,
    input_on: DC::ORANGE,
    input_off: DC::DARK_ORANGE,
    input_toggle_on: DC::LIGHT_PURPLE,
    input_toggle_off: DC::DARK_PURPLE,
    output_on: DC::YELLOW,
    output_off: DC::DARK_YELLOW,
    not_in: DC::LIGHT_BLUE,
    not_out: DC::BLUE,
    relay_switch: DC::PINK,
    relay_no_pole: DC::RED,
    relay_nc_pole: DC::DARK_RED,
    diode_in: DC::GREEN,
    diode_out: DC::DARK_GREEN,
    gpio: DC::PURPLE
    bg: DC::BLACK
  )

  getter start : R::Color
  getter pause : R::Color
  getter wire : R::Color
  getter alt_wire : R::Color
  getter join : R::Color
  getter cross : R::Color
  getter tunnel : R::Color
  getter input_on : R::Color
  getter input_off : R::Color
  getter input_toggle_on : R::Color
  getter input_toggle_off : R::Color
  getter output_on : R::Color
  getter output_off : R::Color
  getter not_in : R::Color
  getter not_out : R::Color
  getter relay_switch : R::Color
  getter relay_no_pole : R::Color
  getter relay_nc_pole : R::Color
  getter diode_in : R::Color
  getter diode_out : R::Color
  getter gpio : R::Color
  getter bg : R::Color

  def initialize(
    @start = DC::LIGHT_GREEN,
    @pause = DC::LIGHT_ORANGE,
    @wire = DC::WHITE,
    @alt_wire = DC::GREY,
    @join = DC::DARK_BROWN,
    @cross = DC::BROWN,
    @tunnel = DC::DARK_BLUE,
    @input_on = DC::ORANGE,
    @input_off = DC::DARK_ORANGE,
    @input_toggle_on = DC::LIGHT_PURPLE,
    @input_toggle_off = DC::DARK_PURPLE,
    @output_on = DC::YELLOW,
    @output_off = DC::DARK_YELLOW,
    @not_in = DC::LIGHT_BLUE,
    @not_out = DC::BLUE,
    @relay_switch = DC::PINK,
    @relay_no_pole = DC::RED,
    @relay_nc_pole = DC::DARK_RED,
    @diode_in = DC::GREEN,
    @diode_out = DC::DARK_GREEN
    @gpio = DC::PURPLE
    @bg = DC::BLACK
  )
  end

  def initialize(filename : String)
    File.open(filename) do |file|
      index = 0
      while (line = file.read_line)
        break if line.chomp.empty?
        index += 1
        case index
        when 1
          raise "Not a .pal file :(" unless line =~ /^JASC-PAL$/
        when 2
          raise "Not a .pal file :(" unless line =~ /^0100$/
        when 4
          @start = _read_color(line)
        when 5
          @pause = _read_color(line)
        when 6
          @wire = _read_color(line)
        when 7
          @alt_wire = _read_color(line)
        when 8
          @join = _read_color(line)
        when 9
          @cross = _read_color(line)
        when 10
          @tunnel = _read_color(line)
        when 11
          @input_on = _read_color(line)
        when 12
          @input_off = _read_color(line)
        when 13
          @input_toggle_on = _read_color(line)
        when 14
          @input_toggle_off = _read_color(line)
        when 15
          @output_on = _read_color(line)
        when 16
          @output_on = _read_color(line)
        when 17
          @not_in = _read_color(line)
        when 18
          @not_out = _read_color(line)
        when 19
          @relay_switch = _read_color(line)
        when 20
          @relay_no_pole = _read_color(line)
        when 21
          @relay_nc_pole = _read_color(line)
        when 22
          @diode_in = _read_color(line)
        when 23
          @diode_out = _read_color(line)
        when 24
          @gpio = _read_color(line)
        when 25
          @bg = _read_color(line)
        end
      end
      raise ".pal did not have enough colors. Only had #{index-2}" if index < 24
    end
  end

  private def _read_color(line) : R::Color
    color_regex = /^([1-2]{0,1}\d{0,1}\d{1}\s){2}([1-2]{0,1}\d{0,1}\d{1})$/
    match_data = color_regex.match(line)

    if match_data.size == 3
      r = match_data[0].to_s.to_u8
      g = match_data[1].to_s.to_u8
      b = match_data[2].to_s.to_u8
      raise "invalid color #{[r, g, b]} in pallette " if [r, g, b].any? { |i| i < 0 || i > 255 }

      return R::Color.new(r: r, g: g, b: b)
    end

    raise "Something went wrong. line was #{line} in _read_color"
  end

  def load_into_components
    WC::Start.color = @start
    WC::Pause.color = @pause
    WC::Wire.color = @wire
    WC::AltWire.color = @alt_wire
    WC::Join.color = @join
    WC::Cross.color = @cross
    WC::Tunnel.color = @tunnel
    WC::InputOn.color = @input_on
    WC::InputOff.color = @input_off
    WC::InputOnToggle.color = @input_on_toggle
    WC::InputOffToggle.color = @input_off_toggle
    WC::OutputOn.color = @output_on
    WC::OutputOff.color = @output_off
    WC::NotIn.color = @not_in
    WC::NotOut.color = @not_out
    WC::RelaySwitch.color = @relay_switch
    WC::RelayNOPole.color = @relay_no_pole
    WC::RelayNCPole.color = @relay_nc_pole
    WC::DiodeIn.color = @diode_in
    WC::DiodeOut.color = @diode_out
  end
end
