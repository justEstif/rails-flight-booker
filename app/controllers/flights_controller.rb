class FlightsController < ApplicationController
  def index
    @departure_airport_options = Airport.joins(:departing_flights).distinct.pluck(:code, :id)
    @arrival_airport_options = Airport.joins(:arriving_flights).distinct.pluck(:code, :id)
    @flights = Flight.search(search_params)
    @date_options = @flights.distinct.pluck(:start_time, :start_time)
  end

  private

  def search_params
    if params[:search].present?
      params.require(:search).permit(:departure_airport, :arrival_airport, :date_time)
    else
      ActionController::Parameters.new # Return an empty parameter object or handle it as needed
    end
  end
end
