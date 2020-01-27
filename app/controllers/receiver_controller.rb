class ReceiverController < ApplicationController

  skip_before_action :verify_authenticity_token
  before_action :authenticate_token

  def leaderboard
    leaderboard_data = JSON.parse(request.body.read)
    ids = Score.insert_all_with_timestamp(leaderboard_data['leaderboard'])
    LeaderboardBroadcastJob.perform_later(ids.pluck('id'))
  end


  private

  def authenticate_token
    render 401 unless params[:token] == 'FT7E3Y68UPA6'
  end
end