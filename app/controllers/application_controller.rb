class ApplicationController < ActionController::Base
  
  before_action :authenticate, only: [:sessions, :users]
	helper_method :current_user
	helper_method :logged_in?

	def current_user    
		User.find(session[:user_id])
	end

	def logged_in?
	  !current_user.nil?  
	end

  def authenticate
   redirect_to root_path unless logged_in?
  end
end
