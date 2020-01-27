class LeaderboardBroadcastJob < ApplicationJob
  queue_as :default

  def perform(ids)
    scores = Score.find ids
    json = ActiveModelSerializers::SerializableResource.new(scores, adapter: :json).as_json
    ActionCable.server.broadcast 'leaderboard_channel', data: json
  end
end
