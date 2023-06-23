class PostsController < ApplicationController
	def index
		@posts = Post.all
	end
	def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def comment
    @post = Post.find(params[:post_id].to_i)
    @comment = @post.comments.create(title: params[:title], user_id: current_user.id )
    if current_user.id != @post.user_id
      CommentPostMailer.with(user: @comment.user).comment_post_email.deliver_now
    end
  end

  def like
  	@post = Post.find(params[:post_id])
    user = @post.user
    @post.likes.create(user_id: current_user.id)
    if current_user.id != @post.user_id
       LikePostMailer.with(user: user).like_post_email.deliver_now   
      # redirect_to post_path(@post)
    end
  end

  def unlike
    @post = Post.find(params[:post_id])
    @like = Like.where(:post_id=>params[:post_id], :user_id=>current_user.id).first
    #@like = @post.likes.first
    @like.destroy
    # redirect_to post_path(@post)    
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end
  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to post_path, status: :see_other
  end

  private
  def post_params
    params.require(:post).permit(:title, :description, :image)
  end
end