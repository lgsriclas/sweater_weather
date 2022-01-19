require 'rails_helper'

RSpec.describe 'Road Trip Facade', :vcr do
  it 'creates a new road trip' do
    trip =RoadTripFacade.road_trip('Hoboken, NJ', 'Lake Placid, NY')

    expect(trip).to be_a(RoadTrip)
    expect(trip.start_city).to eq("Hoboken, NJ")
    expect(trip.end_city).to eq("Lake Placid, NY")
  end
end