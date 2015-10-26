class GizmoRelayJob < ApplicationJob
  def perform(gizmo)
    ActionCable.server.broadcast "gizmos", #messages:#{message.id}:comments",
                                 id: "#gizmo-#{gizmo.id}",
                                 gizmo: GizmosController.render(partial: 'gizmos/gizmo', locals: {gizmo: gizmo})
    ActionCable.server.broadcast "gizmos", #messages:#{message.id}:comments",
                                 id: "#family-#{gizmo.family_id}",
                                 gizmo: GizmosController.render(partial: 'families/family', locals: {family: gizmo.family, node_only: false})
  end
end
