class FlightsController < ApplicationController
  def index
    @departure_airport_options = [["Select an airport",
                                   nil]] + Airport.joins(:departing_flights).distinct.pluck(:code, :id)
    @arrival_airport_options = [["Select an airport",
                                 nil]] + Airport.joins(:arriving_flights).distinct.pluck(:code, :id)
    @date_options = [["Select a date", nil]] + Flight.distinct.pluck(:start_time, :start_time)
    @flights = Flight.search(search_params)
    @number_of_tickets = search_params[:number_of_tickets_select] or 1
  end

  private

  def search_params
    if params[:search].present?
      params.require(:search).permit(:departure_airport, :arrival_airport, :date_time, :number_of_tickets_select)
    else
      ActionController::Parameters.new
    end
  end
end
