class BookingsController < ApplicationController
  def new
    @user = current_user
    @booking = Booking.new
    @dog = Dog.find(params[:dog_id])
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def index
    @user = current_user
    @user.bookings
  end

  def create
    @user = current_user
    @dog = Dog.find(params[:dog_id])
    @booking = Booking.new(booking_params)
    @booking.user = @user
    @booking.dog = @dog
    if @booking.save
      flash[:notice] = 'Your booking was successfully created.'
      redirect_to dog_booking_path(@dog, @booking)
    else
      flash[:alert] = 'Something went wrong with the dates'
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    if @booking.destroy
      flash[:notice] = 'Your booking was successfully canceled.'
      redirect_to dashboard_path
    else
      flash[:alert] = 'Something went wrong'
      redirect_to new_dog_booking_path(@booking)
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:review, :start_date, :end_date)
  end
end
