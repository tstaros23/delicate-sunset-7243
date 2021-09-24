class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    @airline = Airline.all
  end

  def destroy
    flight = Flight.find(params[:id])
    passenger_flight = flight.passenger_flights.where('passenger_id=?', params[:passenger_id]).first
    passenger_flight.destroy
    redirect_to '/flights'

  end
end
