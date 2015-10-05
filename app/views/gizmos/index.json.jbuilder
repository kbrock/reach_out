json.array!(@gizmos) do |gizmo|
  json.extract! gizmo, :id, :name, :status, :color, :updated_at
  json.url gizmo_url(gizmo, format: :json)
end
