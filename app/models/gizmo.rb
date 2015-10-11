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
  validates :name, :presence => true, uniqueness: { scope: :family_id }
  validates :color, :presence => { message: "color is required" }

  delegate :fill_color, to: :family, prefix: true

  def color=(c)
    c &&= COLOR_MAP[c.downcase] || c.downcase.gsub('#','')
    self.color_int = self.class.int_from_hex(c)
  end

  def color
    "#{self.class.hex_from_int(color_int)}"
  end

  def text_status
    status ? "Lit" : "Unlit"
  end

  def fill_color
    status ? color : UNLIT
  end

  def fill_color_int
    status ? color_int : 0
  end

  def stroke_color
    color
  end

  def self.int_from_hex(h)
    h ? h.sub('#','').gsub("00","0").gsub("ff","1").to_i(2) : 0
  end

  def self.hex_from_int(i)
    "##{i.to_s(2).rjust(3,'0').gsub("0","00").gsub("1","ff")}"
  end
end
