require 'test_helper'

class GizmoTest < ActiveSupport::TestCase

  #validation
  test "initialize uses color to translate" do
    assert_equal "#0000ff", gizmo(:color => "0000FF").color.to_s
  end

  test "fill lit" do
    assert_equal "#ff0000", gizmo(:status => true, :color => "r").fill.to_s
  end

  test "fill unlit" do
    assert_equal "#dddddd", gizmo(:status => false, :color => "r").fill.to_s
  end

  test "fill lit loaded from db" do
    assert_equal "#ffff00", gizmo(:status => true, :color_int => 6).fill.to_s
  end

  test "stroke white" do
    assert_equal "#ffffff", gizmo(:color => "w").stroke.to_s
  end

  test "stroke green" do
    assert_equal "#00ff00", gizmo(:color => "g").stroke.to_s
  end
end
