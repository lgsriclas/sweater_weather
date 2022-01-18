require 'rails_helper'

RSpec.describe 'Weather API', :vcr do
  it 'returns current weather forecast for location' do
    get '/api/v1/forecast?location=hoboken,nj',

    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }

    expect(response).to be_successful
    expect(response.status).to eq 200

    forecast = JSON.parse(response.body, symbolize_names: true)

    expect(forecast).to be_a(Hash)
    expect(forecast).to have_key(:data)
    expect(forecast[:data][:id]).to eq(nil)
    expect(forecast[:data][:attributes]).to have_key(:current_weather)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:datetime)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:sunrise)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:sunset)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:temperature)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:feels_like)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:humidity)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:uvi)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:visibility)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:conditions)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:icon)
    expect(forecast[:data][:attributes][:current_weather]).to_not have_key(:clouds)
    expect(forecast[:data][:attributes][:current_weather]).to_not have_key(:wind_speed)
  end

  it 'returns hourly weather forecast for location' do
    get '/api/v1/forecast?location=hoboken,nj',

    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }

    expect(response).to be_successful
    expect(response.status).to eq 200

    forecast = JSON.parse(response.body, symbolize_names: true)

    expect(forecast).to be_a(Hash)
    expect(forecast).to have_key(:data)
    expect(forecast[:data][:id]).to eq(nil)
    expect(forecast[:data][:attributes]).to have_key(:hourly_weather)
    expect(forecast[:data][:attributes][:hourly_weather].first).to have_key(:hour)
    expect(forecast[:data][:attributes][:hourly_weather].first).to have_key(:temperature)
    expect(forecast[:data][:attributes][:hourly_weather].first).to have_key(:conditions)
    expect(forecast[:data][:attributes][:hourly_weather].first).to have_key(:icon)
    expect(forecast[:data][:attributes][:hourly_weather].first).to_not have_key(:dew_point)
    expect(forecast[:data][:attributes][:hourly_weather].first).to_not have_key(:clouds)
  end

  it 'returns daily weather forecast for location' do
    get '/api/v1/forecast?location=hoboken,nj',

    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }

    expect(response).to be_successful
    expect(response.status).to eq 200

    forecast = JSON.parse(response.body, symbolize_names: true)

    expect(forecast).to be_a(Hash)
    expect(forecast).to have_key(:data)
    expect(forecast[:data][:id]).to eq(nil)
    expect(forecast[:data][:attributes]).to have_key(:daily_weather)
    expect(forecast[:data][:attributes][:daily_weather].first).to have_key(:day)
    expect(forecast[:data][:attributes][:daily_weather].first).to have_key(:sunrise)
    expect(forecast[:data][:attributes][:daily_weather].first).to have_key(:sunset)
    expect(forecast[:data][:attributes][:daily_weather].first).to have_key(:min)
    expect(forecast[:data][:attributes][:daily_weather].first).to have_key(:max)
    expect(forecast[:data][:attributes][:daily_weather].first).to have_key(:conditions)
    expect(forecast[:data][:attributes][:daily_weather].first).to have_key(:icon)
    expect(forecast[:data][:attributes][:daily_weather].first).to_not have_key(:clouds)
    expect(forecast[:data][:attributes][:daily_weather].first).to_not have_key(:wind_speed)
  end
end