class DogsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    if params[:query].present?
      @dogs = Dog.search_by_name_and_breed(params[:query])
    else
      @dogs = Dog.all
    end
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
      flash[:notice] = 'Dog-entry was successfully deleted.'
      redirect_to dogboard_path
    else
      flash[:alert] = 'Something went wrong'
      redirect_to dogs_path
    end
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :age, :address, :breed, :description, :photo)
  end
end
