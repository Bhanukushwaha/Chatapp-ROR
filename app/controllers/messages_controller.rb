class MessagesController < ApplicationController
  def create
    @current_user = current_user
    @notification = Notification.create(user_id: current_user.id, receiver_id: params[:message][:receiver_id].to_i)
    @message = @current_user.messages.create(content: msg_params[:content], room_id: params[:room_id])
  end

  def delete
    @message = Message.find_by(id: params[:id])
    if @message
      room = @message.room
      @message.destroy
      redirect_to "/rooms/#{room.id}?name=#{params[:name]}", notice: "Post was successfully destroyed."
    else
      redirect_to "/rooms/#{room.id}?name=#{params[:name]}", error: "Something went rong"
    end
  end

  private
  def msg_params
    params.require(:message).permit(:content)
  end
end
