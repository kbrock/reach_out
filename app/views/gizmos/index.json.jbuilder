json.array!(@gizmos) do |gizmo|
  json.extract! gizmo, :id, :name, :status, :color
  json.url gizmo_url(gizmo, format: :json)
end
