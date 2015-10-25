class GizmoRelayJob < ApplicationJob
  def perform(gizmo)
    ActionCable.server.broadcast "gizmos", #messages:#{message.id}:comments",
                                 gizmo: GizmosController.render(partial: 'gozmos/gizmo', locals: {gizmo: gizmo})
  end
end
