class ChatChannel < ApplicationCable::Channel
	def subscribed
	   stream_from "chat_channel"
  end
  def unsubscribed
    # Any cleanup needed when the channel is unsubscribed
  end
end