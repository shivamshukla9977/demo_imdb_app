class UsersController < ApplicationController
  skip_before_action :authenticate, only: [:new, :create]

  def index
    @user = user.all
  end

  def new ; end

  def create
    user = User.new(user_params)
    if user.save
      user.password!(user_password[:password_enc])
      session[:user_id] = user.id
      redirect_to dashboard_users_path
    else
      redirect_to new_users_path
    end
  end

  def destroy
    
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :contact)
  end

  def user_password
    params.require(:user).permit(:password_enc)
  end
end
