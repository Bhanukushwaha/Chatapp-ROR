class FriendsController < ApplicationController
  def index
  end

  def edit
  end

  def show
  end
  
  def friend_list
    @friends = current_user.receive_requests.where(is_accept: true)
  end

  def messages
    room = params[:sender_id] + params[:receiver_id]
    @friend = User.find_by_id(params[:receiver_id])
    @single_room = Room.find_by_name(room)
    if !@single_room.present?
      @single_room = Room.create(sender_id: params[:sender_id], receiver_id: params[:receiver_id], name: room)
    end
    if @single_room.present?
      redirect_to "/rooms/#{@single_room.id}"
    end
    # @friends = current_user.friends
  end
end
