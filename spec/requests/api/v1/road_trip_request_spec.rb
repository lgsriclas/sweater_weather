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
    expect(response.status).to eq(200)

    trip = JSON.parse(response.body, symbolize_names: true)

    expect(trip).to be_a(Hash)
    expect(trip).to have_key(:data)
    expect(trip[:data]).to have_key(:attributes)
    expect(trip[:data][:attributes]).to have_key(:start_city)
    expect(trip[:data][:attributes][:start_city]).to eq("Hoboken, NJ")
    expect(trip[:data][:attributes]).to have_key(:end_city)
    expect(trip[:data][:attributes][:end_city]).to eq("Lake Placid, NY")
    expect(trip[:data][:attributes]).to have_key(:travel_time)
    expect(trip[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
    expect(trip[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
  end

  it 'sends an error code if API key is invalid' do
    user = User.create(email: 'sally@peanuts.com', password: 'ilovelinus', password_confirmation: 'ilovelinus')

    trip_data =
      {
        origin: "Hoboken, NJ",
        destination: "Lake Placid, NY",
        api_key: ""
      }

    post '/api/v1/road_trip', params: trip_data.to_json,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }

    data = JSON.parse(response.body, symbolize_names: true)[:errors]

    expect(response).to_not be_successful
    expect(response.status).to eq(401)
    expect(data[:details]).to eq('Your API key is incorrect')
  end
end