ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Add more helper methods to be used by all tests here...

  def gizmo(args = {})
    Gizmo.new(args).tap { |g| g.valid? }
  end

  def family(args = {})
    if args[:gizmos]
      args[:gizmos] = args[:gizmos].map do |gizmo|
        (gizmo.kind_of?(Gizmo) ? gizmo : Gizmo.new(gizmo)).tap { |g| g.valid? }
      end
    end
    Family.new(args).tap { |f| f.valid? }
  end
end
