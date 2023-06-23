class CommentsController < ApplicationController
	def index
	 @comments. Comment.all
	end
	def show
	end
	# def create
  #   @post = Post.find(params[:post_id].to_i)
  #   @comment = @post.comments.create(title: params[:comment][:title], user_id: current_user.id ) 
  #   # redirect_to post_path(@post)
  #   # respond_to do |format|
  #   #   format.js
  #   # end       
  # end  
end