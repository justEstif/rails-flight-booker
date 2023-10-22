class BookingsController < ApplicationController
  def new
    @booking = Booking.new(new_booking_params)
    @booking.build_passenger
  end

  def create
    p create_booking_params
    @booking = Booking.new(create_booking_params)

    if @booking.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def new_booking_params
    params.permit(:number_of_tickets, :flight_id)
  end

  def create_booking_params
    params.require(:booking).permit(:number_of_tickets, :flight_id, passenger_attributes: [:name, :email])
  end
end
