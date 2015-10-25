class GizmosChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'gizmos'
  end
end
