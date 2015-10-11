json.extract! @family, :id, :name, :fill_color, :updated_at
json.gizmos do
  json.array!(@family.gizmos) do |gizmo|
    json.extract! gizmo, :id, :status, :color, :updated_at
   json.url gizmo_url(gizmo, format: :json)
  end
end
json.url family_url(@family, format: :json)
