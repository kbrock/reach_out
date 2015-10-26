json.array!(@families) do |family|
  json.ignore_nil!
  json.extract! family, :id, :name
  json.fill family.fill.to_s
  json.gizmos do
    json.array!(family.gizmos) do |gizmo|
      json.extract! gizmo, :id, :name, :status, :updated_at
      json.color gizmo.color.to_s
      json.url gizmo_url(gizmo, format: :json)
    end
  end
  json.url family_url(family, format: :json)
end
