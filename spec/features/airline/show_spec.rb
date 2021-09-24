require 'rails_helper'

RSpec.describe 'show page' do
    it "has a list of the flight numbers, the airline associated with that flight and the names of the flight's passenger" do
      airline = Airline.create!(name: 'UniTED')
      flight = Flight.create!(number: 1, date: '4/30/93', departure_city: 'chicago', arrival_city: 'denver', airline_id: airline.id)
      passenger = Passenger.create!(name: 'Ted', age: 16)
      passenger_2 = Passenger.create!(name: 'Bob', age: 22)
      passenger_3 = Passenger.create!(name: 'Chuck', age: 23)
      PassengerFlight.create!(passenger_id: passenger.id, flight_id: flight.id)
      PassengerFlight.create!(passenger_id: passenger_2.id, flight_id: flight.id)
      PassengerFlight.create!(passenger_id: passenger_3.id, flight_id: flight.id)

      visit "/airlines/#{airline.id}"

      expect(page).to have_content(passenger_2.name)
      expect(page).to have_content(passenger_3.name)
  end
end
