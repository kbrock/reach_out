class Family < ActiveRecord::Base
  has_many :gizmos

  def fill
    @fill ||= Color.combine(gizmos.map(&:fill))
  end

  def fill_color_int # deprecate: use fill instead
    @fill.to_i
  end

  def status
    !@fill.black?
  end

  def fill_color # deprecate: use fill_instead
    fill.black? ? Color::UNLIT : @fill.to_s
  end

  def stroke_color # rename to color
    Color::BLACK
  end
end
