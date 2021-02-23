class DogsController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def index
    @dogs = Dog.all
  end

  def show
    @dogs = Dog.find(params[:id])
  end

  def new
    @dog = Dog.new
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

  def destroy
    @dog = dog.find(dog_params)
    if @dog.destroy
      flash[:success] = 'Dog-entry was successfully deleted.'
    else
      flash[:error] = 'Something went wrong'
    end
    redirect_to dogs_path(@dog)
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :breed, :description)
  end
end
