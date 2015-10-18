require 'test_helper'

class FamiliesShowTest < ActionView::TestCase
  def g
    gizmo(id: 5, name: "g1", color: "r", status: true)
  end

  def f
    family(id: 3, name: "f1", gizmos: [g])
  end

  test "displays a gizmo" do
    @family = f

    render template: "families/show", formats: "json"
    assert_equal({
      "id" => 3,
      "name" => "f1",
      "fill" => "#ff0000",
      "gizmos" => [{
        "id" => 5,
        "name" => "g1",
        "status" => true,
        "color" => "#ff0000",
        "url" => "http://test.host/gizmos/5.json"
      }],
    }, JSON.parse(rendered))
  end
end
