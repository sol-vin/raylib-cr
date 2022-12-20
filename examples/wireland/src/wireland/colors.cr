module Wireland::DefaultColors
  alias R = Raylib

  PINK     = R::Color.new(r: 0xF6, g: 0x75, b: 0x7A, a: 0xFF)
  RED      = R::Color.new(r: 0xE4, g: 0x3B, b: 0x44, a: 0xFF)
  DARK_RED = R::Color.new(r: 0x6E, g: 0x19, b: 0x23, a: 0xFF)

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
  alias DC = Wireland::DefaultColors
  alias WC = Wireland::Component
  alias R = Raylib

  DEFAULT = Wireland::Pallette.new(
    start: DC::LIGHT_GREEN,
    buffer: DC::DARK_BLUE,
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
    switch: DC::PINK,
    no_pole: DC::RED,
    nc_pole: DC::DARK_RED,
    diode_in: DC::GREEN,
    diode_out: DC::DARK_GREEN,
    gpio: DC::PURPLE,
    bg: DC::BLACK
  )

  getter start : R::Color = DC::LIGHT_GREEN
  getter buffer : R::Color = DC::DARK_BLUE
  getter wire : R::Color = DC::WHITE
  getter alt_wire : R::Color = DC::GREY
  getter join : R::Color = DC::DARK_BROWN
  getter cross : R::Color = DC::BROWN
  getter tunnel : R::Color = DC::LIGHT_ORANGE
  getter input_on : R::Color = DC::ORANGE
  getter input_off : R::Color = DC::DARK_ORANGE
  getter input_toggle_on : R::Color = DC::LIGHT_PURPLE
  getter input_toggle_off : R::Color = DC::DARK_PURPLE
  getter output_on : R::Color = DC::YELLOW
  getter output_off : R::Color = DC::DARK_YELLOW
  getter not_in : R::Color = DC::LIGHT_BLUE
  getter not_out : R::Color = DC::BLUE
  getter switch : R::Color = DC::PINK
  getter no_pole : R::Color = DC::RED
  getter nc_pole : R::Color = DC::DARK_RED
  getter diode_in : R::Color = DC::GREEN
  getter diode_out : R::Color = DC::DARK_GREEN
  getter gpio : R::Color = DC::PURPLE
  getter bg : R::Color = DC::BLACK

  def initialize(
    @start = DC::LIGHT_GREEN,
    @buffer = DC::DARK_BLUE,
    @wire = DC::WHITE,
    @alt_wire = DC::GREY,
    @join = DC::DARK_BROWN,
    @cross = DC::BROWN,
    @tunnel = DC::LIGHT_BROWN,
    @input_on = DC::ORANGE,
    @input_off = DC::DARK_ORANGE,
    @input_toggle_on = DC::LIGHT_PURPLE,
    @input_toggle_off = DC::DARK_PURPLE,
    @output_on = DC::YELLOW,
    @output_off = DC::DARK_YELLOW,
    @not_in = DC::LIGHT_BLUE,
    @not_out = DC::BLUE,
    @switch = DC::PINK,
    @no_pole = DC::RED,
    @nc_pole = DC::DARK_RED,
    @diode_in = DC::GREEN,
    @diode_out = DC::DARK_GREEN,
    @gpio = DC::PURPLE,
    @bg = DC::BLACK
  )
  end

  def initialize(filename : String)
    File.open(filename) do |file|
      index = 0
      while (line = file.gets)
        break if line.chomp.empty? || index == 26
        index += 1
        case index
        when 1
          raise "Not a .pal file :(" unless line =~ /^JASC-PAL$/
        when 2
          raise "Not a .pal file :(" unless line =~ /^0100$/
        when 3
          # number of colors
        when 4
          # blank color
        when 5
          @start = _read_color(line)
        when 6
          @buffer = _read_color(line)
        when 7
          @wire = _read_color(line)
        when 8
          @alt_wire = _read_color(line)
        when 9
          @join = _read_color(line)
        when 10
          @cross = _read_color(line)
        when 11
          @tunnel = _read_color(line)
        when 12
          @input_on = _read_color(line)
        when 13
          @input_off = _read_color(line)
        when 14
          @input_toggle_on = _read_color(line)
        when 15
          @input_toggle_off = _read_color(line)
        when 16
          @output_on = _read_color(line)
        when 17
          @output_off = _read_color(line)
        when 18
          @not_in = _read_color(line)
        when 19
          @not_out = _read_color(line)
        when 20
          @switch = _read_color(line)
        when 21
          @no_pole = _read_color(line)
        when 22
          @nc_pole = _read_color(line)
        when 23
          @diode_in = _read_color(line)
        when 24
          @diode_out = _read_color(line)
        when 25
          @gpio = _read_color(line)
        when 26
          @bg = _read_color(line)
        end
      end
      raise ".pal did not have enough colors. Only had #{index - 2}" if index < 26
    end
  end

  def all
    [
      @start,
      @buffer,
      @wire,
      @alt_wire,
      @join,
      @cross,
      @tunnel,
      @input_on,
      @input_off,
      @input_toggle_on,
      @input_toggle_off,
      @output_on,
      @output_off,
      @not_in,
      @not_out,
      @switch,
      @no_pole,
      @nc_pole,
      @diode_in,
      @diode_out,
      @gpio
    ]
  end

  private def _read_color(line) : R::Color
    color_regex = /^([1-2]{0,1}\d{0,1}\d{1}\s){2}([1-2]{0,1}\d{0,1}\d{1})$/
    match_data = color_regex.match(line)
    if md = match_data
      if md.size == 3
        u8s = md[0].split(" ").map(&.to_u8)
        r = u8s[0]
        g = u8s[1]
        b = u8s[2]
        raise "invalid color #{[r, g, b]} in pallette " if [r, g, b].any? { |i| i < 0 || i > 255 }

        return R::Color.new(r: r, g: g, b: b, a: 255)
      end
    end

    raise "Something went wrong. line was #{line} in _read_color"
  end

  def load_into_components
    # Ensure each item is unique
    total = all.size
    raise "Duplicate color" if total != all.uniq.size

    WC::Start.color = @start
    WC::Buffer.color = @buffer
    WC::Wire.color = @wire
    WC::AltWire.color = @alt_wire
    WC::Join.color = @join
    WC::Cross.color = @cross
    WC::Tunnel.color = @tunnel
    WC::InputOn.color = @input_on
    WC::InputOff.color = @input_off
    WC::InputToggleOn.color = @input_toggle_on
    WC::InputToggleOff.color = @input_toggle_off
    WC::OutputOn.color = @output_on
    WC::OutputOff.color = @output_off
    WC::NotIn.color = @not_in
    WC::NotOut.color = @not_out
    WC::Switch.color = @switch
    WC::NOPole.color = @no_pole
    WC::NCPole.color = @nc_pole
    WC::DiodeIn.color = @diode_in
    WC::DiodeOut.color = @diode_out
    WC::GPIO.color = @gpio
  end
end
