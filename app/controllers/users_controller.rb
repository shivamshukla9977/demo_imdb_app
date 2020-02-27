class UsersController < ApplicationController
  skip_before_action :authenticate, only: [:new, :create]

  def index
    @users = User.all
  end

  def new ; end

  def create
    user = User.new(user_params)
    if user.save
      user.password!(user_password[:password_enc])
      redirect_to dashboard_users_path
    else
      redirect_to new_users_path
    end
  end

  def destroy
    
  end

  # def update
  #   @user = User.find(params[:id])
  #   @user.update(user_params)
  #   redirect_to user_path(@input)
  # end

  private

  def user_params
    params.require(:user).permit(:name, :email, :contact)
  end

  def user_password
    params.require(:user).permit(:password_enc)
  end
end
