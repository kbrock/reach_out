class GizmoRelayJob < ApplicationJob
  def perform(gizmo)
    ActionCable.server.broadcast "gizmos", #messages:#{message.id}:comments",
                                 id: "#gizmo-#{gizmo.id}",
                                 html: GizmosController.render(partial: 'gizmos/gizmo', locals: {gizmo: gizmo}),
                                 data: GizmosController.render(partial: 'gizmos/gizmo', locals: {gizmo: gizmo}, formats: 'json')
    ActionCable.server.broadcast "gizmos", #messages:#{message.id}:comments",
                                 id: "#family-#{gizmo.family_id}",
                                 html: GizmosController.render(partial: 'families/family', locals: {family: gizmo.family, node_only: false}),
                                 data: GizmosController.render(partial: 'families/family', locals: {family: gizmo.family, node_only: false}, formats: 'json')
  end
end
