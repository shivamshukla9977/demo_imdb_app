class PeopleController < ApplicationController
  skip_before_action :authenticate_user!

  def new
   
  end

  def create
    @person = Person.create(person_params)
    render 'show'
  end

  def show
    
  end

  private

  def person_params
    params.require(:person).permit(:name, :dob, :gender)
  end
end
