require 'rails_helper'

RSpec.describe 'index page' do


# As a visitor
# When I visit the flights index page
# I see a list of all flight numbers
# And next to each flight number I see the name of the Airline of that flight
# And under each flight number I see the names of all that flight's passengers
  it "has a list of the flight numbers, the airline associated with that flight and the names of the flight's passenger" do
    airline = Airline.create!(name: 'UniTED')
    flight = Flight.create!(number: 1, date: '4/30/93', departure_city: 'chicago', arrival_city: 'denver', airline_id: airline.id)
    passenger = Passenger.create!(name: 'Ted', age: 28)
    passenger = Passenger.create!(name: 'Bob', age: 22)
    PassengerFlight.create!(passenger_id: passenger.id, flight_id: flight.id)
    PassengerFlight.create!(passenger_id: passenger_2.id, flight_id: flight.id)

    flight_2 = Flight.create!(number: 2, date: '4/30/93', departure_city: 'denver', arrival_city: 'chicago', airline_id: airline.id)
    passenger_3 = Passenger.create!(name: 'Ted', age: 28)
    passenger_4 = Passenger.create!(name: 'Bob', age: 22)

    PassengerFlight.create!(passenger_id: passenger_3.id, flight_id: flight_2.id)
    PassengerFlight.create!(passenger_id: passenger_4.id, flight_id: flight_2.id)


    visit '/flights'

    expect(page).to have_content(flight.number)
    expect(page).to have_content(flight_2.number)
    expect(page).to have_content(airline.name)
  end
end
