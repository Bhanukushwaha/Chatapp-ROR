class RoomsController < ApplicationController
  def index
  	@friends3 = current_user.receive_requests.where(is_accept: true)
  	@friends4 = current_user.send_requests.where(is_accept: true)
  	@friends = @friends3 + @friends4
    @current_user = current_user
    redirect_to '/signin' unless @current_user
    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)
    @room = Room.new
    current_user.notifications.update_all(is_read_header: true)
  end

  def show
  	@user = User.find_by(username: params[:name])
    @room_user_name = params[:name]
	  @current_user = current_user
	  @friends3 = current_user.receive_requests.where(is_accept: true)
  	@friends4 = current_user.send_requests.where(is_accept: true)
  	@friends = @friends3 + @friends4
	  @single_room = Room.find(params[:id])
	  @rooms = Room.public_rooms
	  # @users = User.all_except(@current_user)
	  @room = Room.new
	  @message = Message.new
	  render "index"
	end
end
