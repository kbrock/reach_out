class Color
  BPC = 2 # BITS_PER_COLOR = 256

  COLOR_MAP = {
    "n" => "000000",
    "r" => "ff0000",
    "g" => "00ff00",
    "b" => "0000ff",
    "w" => "ffffff"
  }

  attr_accessor :i, :hex_color

  def initialize(i = nil, hex_color = nil)
    if i.kind_of?(String)
      self.h = i
    else
      self.i = i
    end
    self.hex_color = hex_color
  end

  def black?
    i == 0
  end

  def non_black?
    !black
  end

  def non_black
    self unless black?
  end

  def color_value
    i / (BPC * BPC) + ((i / BPC) % BPC) + (i % BPC)
  end

  def contrast
    light? ? BLACK : WHITE
  end

  def h
    hex_color || hex_from_int(@i)
  end

  def h=(h)
    @i = int_from_hex(COLOR_MAP[h.downcase] || h.downcase)
  end

  def light?
    color_value > (BPC-1)*3.0/2
  end

  alias_method :to_i, :i
  alias_method :to_s, :h
#  alias_method :inspect, :h

  def int_from_hex(x)
    x ? x.sub('#','').gsub("00","0").gsub("ff","1").to_i(2) : 0
  end

  private :int_from_hex

  def hex_from_int(x)
    "##{x.to_s(2).rjust(3,'0').gsub("0","00").gsub("1","ff")}"
  end

  private :hex_from_int

  def self.combine(c)
    Color.new(c.map(&:to_i).sum)
  end

  UNLIT = Color.new(0, "#dddddd")
  BLACK = Color.new("n")
  WHITE = Color.new("w")
end
