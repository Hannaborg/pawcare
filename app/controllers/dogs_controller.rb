class DogsController < ApplicationController
  skip_before_action :authenticate_user!, only: :dogs

  def index
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user = current_user
    if @dog.save
      flash[:success] = "Dog-entry successfully created"
      redirect_to dog_path(@dog)
    else
      flash[:error] = "Something went wrong"
      render :new
    end
  end

  def destroy
    @dog = Dog.find(params[:id])
    if @dog.destroy
      flash[:success] = 'Dog-entry was successfully deleted.'
    else
      flash[:error] = 'Something went wrong'
    end
    redirect_to dogs_path
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :breed, :description)
  end
end
