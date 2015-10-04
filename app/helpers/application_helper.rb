module ApplicationHelper
  def gizmo_svg(gizmo = nil)
    fill = gizmo.try(:fill_color) || "none"
    stroke = gizmo.try(:stroke_color) || "black"
    name = gizmo.try(:name) || "+"
    raw %{<svg width="100" height="100">
      <rect width="100" height="100" style="fill:#{fill};stroke:#{stroke};"></rect>
      <text x="50" y="15" class="gizmo-name">#{name}</text>
      </svg>}
  end

  def new_gizmo(attrs = nil)
    attrs = attrs.present? ? {:gizmo => attrs} : {}
    link_to gizmo_svg, new_gizmo_path(attrs), class: "gizmo-new"
  end
end
