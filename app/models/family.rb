class Family < ActiveRecord::Base
  has_many :gizmos

  accepts_nested_attributes_for :gizmos
end
