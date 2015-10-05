module ApplicationHelper
  def gizmo_svg(gizmo = nil)
    fill = gizmo.try(:fill_color) || "none"
    stroke = gizmo.try(:stroke_color) || "black"
    name = gizmo.try(:name) || "+"
    raw %{<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
      width="110px" height="110px">
      <use xlink:href = "#gizmo" style="fill:#{fill};stroke:#{stroke};" />
      <text x="55" y="55" class="gizmo-name">#{name}</text>
      </svg>}
  end

  def new_gizmo(attrs = nil)
    attrs = attrs.present? ? {:gizmo => attrs} : {}
    link_to gizmo_svg, new_gizmo_path(attrs), class: "gizmo gizmo-new"
  end
end
