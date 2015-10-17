require 'test_helper'

class GizmosHelperTest < ActionView::TestCase
  test "gizmo_svg empty" do
    assert_match(/fill:none/, gizmo_svg)
    assert_match(/stroke:black/, gizmo_svg)
    assert_match(/name">\+<\//, gizmo_svg)
  end

  test "new_gizmo empty" do
    assert_match(%r{href="/gizmos/new"}, new_gizmo)
  end
end
