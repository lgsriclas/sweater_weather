require 'rails_helper'

RSpec.describe 'Road Trip', :vcr do
  it 'returns road trip data' do
    user = User.create(email: 'sally@peanuts.com', password: 'ilovelinus', password_confirmation: 'ilovelinus')

    trip_data =
      {
        origin: "Hoboken, NJ",
        destination: "Lake Placid, NY",
        api_key: user.api_key
      }

    post '/api/v1/road_trip', params: trip_data.to_json,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }

    expect(response).to be_successful
    expect(response.status).to eq(204)
    require "pry"; binding.pry

    trip = JSON.parse(response.body, symbolize_names: true)

    expect(trip).to be_a(Hash)
  end
end