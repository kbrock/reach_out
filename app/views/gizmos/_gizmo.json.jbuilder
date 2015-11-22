json.ignore_nil!
json.extract! gizmo, :id, :name, :status, :updated_at
json.color gizmo.color.to_s
json.fill gizmo.fill.to_s
json.family_fill gizmo.family_fill.to_s
