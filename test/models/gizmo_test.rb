require 'test_helper'

class GizmoTest < ActiveSupport::TestCase

  #validation
  test "initialize uses color to translate" do
    assert_equal "#0000ff", gizmo(:color => "0000FF").color.to_s
  end

  test "fill_color lit" do
    assert_equal "#ff0000", gizmo(:status => true, :color => "r").fill_color.to_s
  end

  test "fill_color unlit" do
    assert_equal "#dddddd", gizmo(:status => false, :color => "r").fill_color.to_s
  end

  test "fill_color lit loaded from db" do
    assert_equal "#ffff00", gizmo(:status => true, :color_int => 6).fill_color.to_s
  end

  test "stroke_color white" do
    assert_equal "#ffffff", gizmo(:color => "w").stroke_color.to_s
  end

  test "stroke_color green" do
    assert_equal "#00ff00", gizmo(:color => "g").stroke_color.to_s
  end
end
