require 'test_helper'

class GizmoTest < ActiveSupport::TestCase

  #validation
  test "initialize removes hash" do
    assert_equal gizmo(:color => "#000000").color, "000000"
  end

  test "initialize downcases" do
    assert_equal "000000ff", gizmo(:color => "#000000FF").color
  end

  #test_status
  test "text_status lit" do
    assert_equal "Unlit", gizmo(:status => false).text_status
  end

  test "text_status unlit" do
    assert_equal "Lit", gizmo(:status => true).text_status
  end

  test "fill_color lit" do
    assert_equal "#000000", gizmo(:status => true, :color => "#000000").fill_color
  end

  test "fill_color unlit" do
    assert_equal "#dddddd", gizmo(:status => false, :color => "#000000").fill_color
  end

  #fill_color_int
  test "fill_color_int white lit" do
    assert_equal 16777215, gizmo(:status => true, :color => "#ffffff").fill_color_int
  end

  test "fill_color_int red lit" do
    assert_equal 16711680, gizmo(:status => true, :color => "#ff0000").fill_color_int
  end

  test "fill_color_int unlint" do
    assert_equal 0, gizmo(:status => false, :color => "#ff0000").fill_color_int
  end

  test "stroke_color white" do
    assert_equal "#000000", gizmo(:color => "#000000").tap {|g| g.valid?}.stroke_color
  end

  test "stroke_color green" do
    assert_equal "#00ff00", gizmo(:color => "#00ff00").tap {|g| g.valid?}.stroke_color
  end
end
