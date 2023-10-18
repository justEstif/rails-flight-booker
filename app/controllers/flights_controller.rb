class FlightsController < ApplicationController
  def index
    @flights = Flight.search(params[:search])
    @date_options = @flights.distinct.pluck(:start_time, :start_time)
    # get the codes of airports that have departing or arrival flights
    @departure_airport_options = Airport.joins(:departing_flights).distinct.pluck(:code, :code)
    @arrival_airport_options = Airport.joins(:arriving_flights).distinct.pluck(:code, :code)
  end

  private

  def search_params
    params.require(:flights).permit(:departure_airport, :arrival_airport, :start_time)
  end
end
