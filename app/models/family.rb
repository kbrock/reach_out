class Family < ActiveRecord::Base
  has_many :gizmos

  def fill_color_int
    gizmos.map(&:fill_color_int).sum
  end

  def status
    fill_color_int != 0
  end

  def fill_color
    status ? Gizmo.hex_from_int(fill_color_int) : Gizmo::UNLIT
  end

  def stroke_color
    Gizmo::BLACK
  end
end
