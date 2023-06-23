class LikePostMailer < ApplicationMailer
	def like_post_email
		@user = params[:user]
		@url  = 'http://example.com/login'
		mail(to: @user.email, subject: 'To reset your password')
	end
end
