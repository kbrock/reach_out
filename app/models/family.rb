class Family < ActiveRecord::Base
  has_many :gizmos, -> { order(:id) }

  def fill
    @fill ||= Color.combine(gizmos.map(&:fill)).non_black || Color::UNLIT
  end

  def status
    fill.non_black?
  end

  def stroke
    Color::BLACK
  end
end
