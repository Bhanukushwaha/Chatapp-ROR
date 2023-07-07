class ApplicationController < ActionController::Base
	# helper_method :current_user
	# include ApplicationHelper
	before_action :authenticate_user!
	before_action :update_last_request_at
	def update_last_request_at
		if user_signed_in?
	 		current_user.last_request_at = DateTime.now
	 		current_user.save(validate: false)
		end
	end
	before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email,:password_confirmation,:password])
  end
end
