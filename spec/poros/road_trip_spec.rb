require 'rails_helper'

RSpec.describe 'Road Trip', :vcr do
  it 'returns road trip data' do
    trip = RoadTripFacade.road_trip('Hoboken, NJ', 'Lake Placid, NY')

    expect(trip.start_city).to eq('Hoboken, NJ')
    expect(trip.end_city).to eq('Lake Placid, NY')
    expect(trip.travel_time).to be_a(String)
    expect(trip.weather_at_eta).to have_key(:temperature)
    expect(trip.weather_at_eta).to have_key(:conditions)
  end
end