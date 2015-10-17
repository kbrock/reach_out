module ColorMixin
  BPC = 2 # BITS_PER_COLOR = 256
  UNLIT="#dddddd"
  BLACK="#000000"

  COLOR_MAP = {
    "n" => "000000",
    "r" => "ff0000",
    "g" => "00ff00",
    "b" => "0000ff",
    "w" => "ffffff"
  }

  def hex_from_abbreviation(c)
    c &&= COLOR_MAP[c.downcase] || c.downcase.gsub('#','')
  end

  def int_from_hex(h)
    h ? h.sub('#','').gsub("00","0").gsub("ff","1").to_i(2) : 0
  end

  def hex_from_int(i)
    "##{i.to_s(2).rjust(3,'0').gsub("0","00").gsub("1","ff")}"
  end

  def color_contrast
    color_contrasting_hex(color_int)
  end

  def fill_contrast
    color_contrasting_hex(fill_color_int)
  end

  def color_value(c)
    c / (BPC * BPC) + ((c / BPC) % BPC) + (c % BPC)
  end

  def color_light?(c)
    color_value(c) > (BPC-1)*3.0/2
  end

  def color_contrasting_hex(c)
    color_light?(c) ? "#000000" : "#ffffff"
  end
end
