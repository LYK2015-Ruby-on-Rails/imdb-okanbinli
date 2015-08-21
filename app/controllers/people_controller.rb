class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @people = Person.all
    @people = @people.sort_by {|word| word.name.first(1)}

  end

  def show
    @acted_movies = @person.acted_movies
    @directed_movies = @person.directed_movies
  end

  def new
    @person = Person.new
  end

  def create
    @person = current_user.people.create(person_params)
    if @person.save
      redirect_to people_path, notice: "Person Created."
    else
      render :new
    end

  end

  def edit

  end

  def update
    if @person.update(person_params)
      redirect_to people_path, notice: "Person Edited"
    else
      render :edit
    end
  end

  def destroy

  end

  private
  def set_person
    @person = Person.friendly.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:name, :bio, :age, :image)
  end

end
