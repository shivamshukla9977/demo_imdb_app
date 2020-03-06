class ProfilesController < ApplicationController
  def index
    @profiles = User.all
  end
end
