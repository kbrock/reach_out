class Gizmo < ActiveRecord::Base
  belongs_to :family
  validates :name, :presence => true, uniqueness: { scope: :family_id }
  validates :color, :presence => { message: "color is required" }

  delegate :fill, to: :family, prefix: true

  def color=(c)
    @color = Color.new(c)
    self.color_int = @color.to_i
  end

  def color
    @color ||= Color.new(color_int)
  end

  def fill
    status ? color : Color::UNLIT
  end

  def stroke
    color
  end
end
