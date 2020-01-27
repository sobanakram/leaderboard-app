class LeaderboardChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'leaderboard_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
