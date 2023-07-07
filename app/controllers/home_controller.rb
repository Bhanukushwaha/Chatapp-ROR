class HomeController < ApplicationController
	def index
		@friends = (current_user.receive_requests.where(is_accept: true).map(&:sender_id)) + (current_user.send_requests.where(is_accept: true).map(&:receiver_id))
		@posts = Post.where(user_id: @friends)
	end
end
