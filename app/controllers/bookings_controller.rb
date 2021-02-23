class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @dog = Dog.find(params[:dog_id])
  end

  def create
    @dog = Dog.find(params[:dog_id])
    @booking = Booking.new(booking_params)
    @booking.dog = @dog
    @booking.user = current_user
    if @booking.save
      redirect_to @dog
    else
      render dog_path(@dog)
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    if @booking.destroy
      flash[:success] = 'Your booking was successfully canceled.'
      redirect_to dogs_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to new_dog_booking_path(@booking)
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:review, :start_date, :end_date, :user_id)
  end
end
