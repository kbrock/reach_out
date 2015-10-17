class Gizmo < ActiveRecord::Base
  belongs_to :family
  validates :name, :presence => true, uniqueness: { scope: :family_id }
  validates :color, :presence => { message: "color is required" }

  delegate :fill_color, to: :family, prefix: true

  def color=(c)
    @color = Color.new(c)
    self.color_int = @color.to_i
  end

  def color
    @color ||= Color.new(color_int)
  end

  def color_contrast # deprecate, call contrast from controller
    color.contrast.to_s
  end

  def fill
    status ? color : Color::UNLIT
  end

  def fill_contrast # deprecate, call contrast from controller
    fill.contrast.to_s
  end

  def fill_color # deprecate use fill instead
    fill.to_s
  end

  def fill_color_int # deprecate: use fill instead
    fill.to_i
  end

  def stroke_color # todo: rename to stroke and remove to_s
    color.to_s
  end
end
