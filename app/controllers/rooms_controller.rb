class RoomsController < ApplicationController
  def index
  	@friends = current_user.receive_requests.where(is_accept: true)
    @current_user = current_user
    redirect_to '/signin' unless @current_user
    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)
    @room = Room.new
  end

  def show
    @room_user_name = params[:name]
	  @current_user = current_user
	  @friends = current_user.receive_requests.where(is_accept: true)
	  @single_room = Room.find(params[:id])
	  @rooms = Room.public_rooms
	  # @users = User.all_except(@current_user)
	  @room = Room.new
	  @message = Message.new
	  render "index"
	end

end
