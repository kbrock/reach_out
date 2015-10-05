json.array!(@families) do |family|
  json.extract! family, :id, :name, :
  json.array!(family.gizmos) do |gizmo|
    json.extract! gizmo, :id, :status
  end
  json.url family_url(family, format: :json)
end
