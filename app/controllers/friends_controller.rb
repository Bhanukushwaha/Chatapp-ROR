class FriendsController < ApplicationController
  def index
  end

  def user_modal
    @user = User.new
  end
  
  def friend_list
    @friends1 = current_user.receive_requests.where(is_accept: true)
    @friends2 = current_user.send_requests.where(is_accept: true)
    @friends = @friends1 + @friends2
  end

  def messages
   @single_room = Room.find_by(sender_id: params[:sender_id].to_i, receiver_id: params[:receiver_id].to_i) || Room.find_by(sender_id: params[:receiver_id].to_i, receiver_id: params[:sender_id].to_i)
    @friend = User.find_by_id(params[:receiver_id])
    if @single_room.present?
      redirect_to "/rooms/#{@single_room.id}?name=#{params[:user_name]}"
    end
  end
end
