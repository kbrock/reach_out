class Family < ActiveRecord::Base
  has_many :gizmos

  include ColorMixin

  def fill_color_int
    gizmos.map(&:fill_color_int).sum
  end

  def status
    fill_color_int != 0
  end

  def fill_color
    status ? hex_from_int(fill_color_int) : UNLIT
  end

  def stroke_color
    BLACK
  end
end
