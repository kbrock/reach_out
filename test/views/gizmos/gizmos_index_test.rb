require 'test_helper'

class GizmosIndexTest < ActionView::TestCase
  def f
    family(name: "f1", gizmos: [gizmo(color: "r")])
  end

  def g
    @g ||= gizmo(id: 5, name: "g1", color: "g", status: true, family: f)
  end

  test "displays a gizmo" do
    @gizmos = [g]

    render template: "gizmos/index", formats: "json"
    assert_equal([
      "id" => 5,
      "name" => "g1",
      "status" => true,
      "color" => "#00ff00",
      "fill" => "#00ff00",
      "family_fill" => "#dddddd",
      "url" => "http://test.host/gizmos/5.json"
    ], JSON.parse(rendered))
  end
end
