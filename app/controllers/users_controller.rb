class UsersController < ApplicationController
  skip_before_action :authenticate_user!

  # def show
  #   redirect_to root_path
  # end
end
