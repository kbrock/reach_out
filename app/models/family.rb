class Family < ActiveRecord::Base
  has_many :gizmos

  UNLIT="#dddddd"
  BLACK="#000000"

  def fill_color_int
    gizmos.map(&:fill_color_int).sum
  end

  def fill_color
    fill_color_int == 0 ? UNLIT : "##{fill_color_int.to_s(16).downcase.rjust(6,'0')}"
  end

  def stroke_color
    BLACK
  end
end
