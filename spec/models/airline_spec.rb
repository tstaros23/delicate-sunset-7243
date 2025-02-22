require 'rails_helper'

RSpec.describe Airline do
  describe 'relationships' do
    it { should have_many(:flights) }
    it {should have_many(:passengers).through(:passenger_flights)}
    end

    it "has a list of the flight numbers, the airline associated with that flight and the names of the flight's passenger" do
      airline = Airline.create!(name: 'UniTED')
      flight = Flight.create!(number: 1, date: '4/30/93', departure_city: 'chicago', arrival_city: 'denver', airline_id: airline.id)
      passenger = Passenger.create!(name: 'Ted', age: 16)
      passenger_2 = Passenger.create!(name: 'Bob', age: 22)
      passenger_3 = Passenger.create!(name: 'Chuck', age: 23)
      PassengerFlight.create!(passenger_id: passenger.id, flight_id: flight.id)
      PassengerFlight.create!(passenger_id: passenger_2.id, flight_id: flight.id)
      PassengerFlight.create!(passenger_id: passenger_3.id, flight_id: flight.id)



      expect(airline.unique_adult_passengers).to eq([passenger_2, passenger_3])
    end
end
