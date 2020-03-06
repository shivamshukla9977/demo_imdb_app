class PeopleController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @people = Person.all
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.create(person_params)
    render 'show'
  end

  def show
    @person = Person.find(params[:id])
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])
    if @person.update(person_params)
      redirect_to @person
    else
      render 'edit'
    end
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy
  end

  private

  def person_params
    params.require(:person).permit(:name, :dob, :gender, :image)
  end
end
