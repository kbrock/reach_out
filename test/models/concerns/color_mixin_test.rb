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
end
