require 'test_helper'

class GizmosShowTest < ActionView::TestCase
  def f
    family(name: "f1", gizmos: [gizmo(color: "r")])
  end

  def g
    @g ||= gizmo(id: 5, name: "g1", color: "g", status: true, family: f)
  end

  test "displays a gizmo" do
    @gizmo = g

    render template: "gizmos/show", formats: "json"
    assert_equal({
      "id" => 5,
      "name" => "g1",
      "status" => true,
      "color" => "#00ff00",
      "fill" => "#00ff00",
      "family_fill" => "#dddddd",
    }, JSON.parse(rendered))
  end
end
