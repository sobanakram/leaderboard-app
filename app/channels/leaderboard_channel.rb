class LeaderboardChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'leaderboard_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    message = current_user.messages.new(body: data['message'], chatroom_id: data['chatroom_id'])
    image = Paperclip.io_adapters.for(data['image'])
    image.original_filename = 'file.jpg'
    message.image = image
    message.save
  end
end
