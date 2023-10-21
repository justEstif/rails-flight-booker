class BookingsController < ApplicationController
  def new
    @booking = Booking.new(number_of_tickets: new_booking_params[:number_of_tickets], flight_id: new_booking_params[:selected_flight])
  end

  def create
    @booking = Booking.new()
  end

  private

  def new_booking_params
    params.permit(:number_of_tickets, :selected_flight)
  end
end
