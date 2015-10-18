require 'test_helper'

class FamiliesIndexTest < ActionView::TestCase
  def g
    gizmo(id: 5, name: "g1", color: "r", status: true)
  end

  def f
    family(id: 3, name: "f1", gizmos: [g])
  end

  test "displays a gizmo" do
    @families = [f]

    render template: "families/index", formats: "json"
    assert_equal([
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
      "url" => "http://test.host/families/3.json",
    ], JSON.parse(rendered))
  end
end
