class Gizmo < ActiveRecord::Base
  include ColorMixin

  belongs_to :family
  validates :name, :presence => true, uniqueness: { scope: :family_id }
  validates :color, :presence => { message: "color is required" }

  delegate :fill_color, to: :family, prefix: true

  def color=(c)
    self.color_int = int_from_hex(hex_from_abbreviation(c))
  end

  def color
    hex_from_int(color_int)
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
end
