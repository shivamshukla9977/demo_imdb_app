class SessionsController < ApplicationController
  skip_before_action :authenticate, only: [:new, :create]

  def new ; end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate?(params[:password_enc])
      session[:user_id] = user.id
      redirect_to dashboard_user_path(current_user)
    else
      redirect_to root_path
    end
  end

  def login
    
  end

  def welcome
  end

  def destroy
    reset_session
    current_user = nil
    redirect_to root_path
  end
end
