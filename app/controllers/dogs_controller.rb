class DogsController < ApplicationController
  def index
    @dogs = Dog.all
  end

  def show
    @dogs = Dog.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @dog = Object.new(dog_params)
    if @dog.save
      flash[:success] = "Dog-entry successfully created"
      redirect_to dogs_path(@dog)
    else
      flash[:error] = "Something went wrong"
      render :new
    end
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :breed, :description)
  end
end
