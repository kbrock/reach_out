require 'test_helper'

class ColorMixinTest < ActiveSupport::TestCase
  # fill_value (from fill_color_int)
  test "color_contrast" do
    assert_equal("#ffffff", gizmo(color: "n").color_contrast)
    assert_equal("#ffffff", gizmo(color: "r").color_contrast)
    assert_equal("#ffffff", gizmo(color: "g").color_contrast)
    assert_equal("#ffffff", gizmo(color: "b").color_contrast)
    assert_equal("#000000", gizmo(color: "#ff00ff").color_contrast)
    assert_equal("#000000", gizmo(color: "w").color_contrast)
  end

  # fill_value (from fill_color_int)
  test "fill_contrast" do
    assert_equal("#ffffff", gizmo(color: "b", status: true).fill_contrast)
    assert_equal("#ffffff", gizmo(color: "r", status: true).fill_contrast)
    assert_equal("#ffffff", gizmo(color: "g", status: true).fill_contrast)
    assert_equal("#ffffff", gizmo(color: "b", status: true).fill_contrast)
    assert_equal("#000000", gizmo(color: "#ff00ff", status: true).fill_contrast)
    assert_equal("#000000", gizmo(color: "w", status: true).fill_contrast)
  end

  # #color_value
  # test "#color_value" do
  #   assert_equal 0, gizmo.color_value(0)
  #   assert_equal 255, gizmo.color_value(0xff)
  #   assert_equal 255, gizmo.color_value(0xff00)
  #   assert_equal 255, gizmo.color_value(0xff0000)
  #   assert_equal 510, gizmo.color_value(0xff00ff)
  #   assert_equal 765, gizmo.color_value(0xffffff)
  # end

  # test "#color_light?" do
  #   assert_equal false, gizmo.color_light?(0)
  #   assert_equal false, gizmo.color_light?(0xff)
  #   assert_equal false, gizmo.color_light?(0xff00)
  #   assert_equal false, gizmo.color_light?(0xff0000)
  #   assert_equal true, gizmo.color_light?(0xff00ff)
  #   assert_equal true, gizmo.color_light?(0xffffff)
  # end

  # test "#color_contrasting_hex" do
  #   assert_equal "#ffffff", gizmo.color_contrasting_hex(0)
  #   assert_equal "#ffffff", gizmo.color_contrasting_hex(0xff)
  #   assert_equal "#ffffff", gizmo.color_contrasting_hex(0xff00)
  #   assert_equal "#ffffff", gizmo.color_contrasting_hex(0xff0000)
  #   assert_equal "#000000", gizmo.color_contrasting_hex(0xff00ff)
  #   assert_equal "#000000", gizmo.color_contrasting_hex(0xffffff)
  # end
end
