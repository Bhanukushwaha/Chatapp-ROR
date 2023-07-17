class HomeController < ApplicationController
	def index
		@friends = (current_user.receive_requests.where(is_accept: true).map(&:sender_id)) + (current_user.send_requests.where(is_accept: true).map(&:receiver_id))
		ids = @friends << current_user.id
		@posts = Post.where(user_id: ids).paginate(page: (params[:page] || 1), per_page: 10)
	end
end
