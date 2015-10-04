class Gizmo < ActiveRecord::Base
  UNLIT="#dddddd"
  BLACK="#000000"

  COLOR_MAP = {
    "n" => "000000",
    "r" => "ff0000",
    "g" => "00ff00",
    "b" => "0000ff",
    "w" => "ffffff"
  }

  belongs_to :family

  before_validation do |r|
    r.color &&= COLOR_MAP[r.color.downcase] || r.color.downcase.gsub('#','')
  end

  def color_int
    self.class.int_from_hex(color)
  end

  def color_hex
    "##{color}"
  end

  def text_status
    status ? "Lit" : "Unlit"
  end

  def fill_color
    status ? color_hex : UNLIT
  end

  def fill_color_int
    status ? color_int : 0
  end

  def stroke_color
    color_hex
  end

  def self.int_from_hex(h)
    h.sub('#','').to_i(16)
  end

  def self.hex_from_int(i)
    "##{i.to_s(16).downcase.rjust(6,'0')}"
  end
end
