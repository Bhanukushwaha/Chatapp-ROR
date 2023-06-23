class CommentPostMailer < ApplicationMailer
	def comment_post_email
		@user = params[:user]
		@url  = 'http://example.com/login'
		mail(to: @user.email, subject: 'To thank you for comment')
	end
end
