class Gizmo < ActiveRecord::Base
  UNLIT="#dddddd"
  BLACK="#000000"

  belongs_to :family

  before_validation do |r|
    if r.color
      r.color.gsub!('#','')
      r.color.downcase!
    end
  end

  def text_status
    status ? "Lit" : "Unlit"
  end

  def fill_color
    status ? stroke_color : UNLIT
  end

  def fill_color_int
    status ? color.sub('#','').to_i(16) : 0
  end

  def stroke_color
    "##{color}"
  end
end
