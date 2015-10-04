require 'test_helper'

class GizmoTest < ActiveSupport::TestCase

  #validation
  test "initialize works with nonhash" do
    assert_equal "#000000", gizmo(:color => "000000").color
  end

  test "initialize works with hashes" do
    assert_equal "#ff0000", gizmo(:color => "#ff0000").color
  end

  test "initialize downcases" do
    assert_equal "#0000ff", gizmo(:color => "0000FF").color
  end

  test "initialize lookup" do
    assert_equal "#ff0000", gizmo(:color => "r").color
  end

  #test_status
  test "text_status lit" do
    assert_equal "Unlit", gizmo(:status => false).text_status
  end

  test "text_status unlit" do
    assert_equal "Lit", gizmo(:status => true).text_status
  end

  test "fill_color lit" do
    assert_equal "#ff0000", gizmo(:status => true, :color => "r").fill_color
  end

  test "fill_color unlit" do
    assert_equal "#dddddd", gizmo(:status => false, :color => "r").fill_color
  end

  #fill_color_int
  test "fill_color_int white lit" do
    assert_equal 7, gizmo(:status => true, :color => "w").fill_color_int
  end

  test "fill_color_int red lit" do
    assert_equal 4, gizmo(:status => true, :color => "r").fill_color_int
  end

  test "fill_color_int unlint" do
    assert_equal 0, gizmo(:status => false, :color => "r").fill_color_int
  end

  test "stroke_color white" do
    assert_equal "#ffffff", gizmo(:color => "w").stroke_color
  end

  test "stroke_color green" do
    assert_equal "#00ff00", gizmo(:color => "g").stroke_color
  end
end
