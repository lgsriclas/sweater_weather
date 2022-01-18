require 'rails_helper'

RSpec.describe 'Weather Service', :vcr do
  it 'gets current weather forecast for a given location' do
    lat = 51.5085
    lon = -0.1257

    forecast = WeatherService.get_weather_forecast(lat, lon)

    expect(forecast).to be_a(Hash)
    expect(forecast).to have_key(:current)
    expect(forecast[:current]).to have_key(:dt)
    expect(forecast[:current]).to have_key(:sunrise)
    expect(forecast[:current]).to have_key(:sunset)
    expect(forecast[:current]).to have_key(:temp)
    expect(forecast[:current]).to have_key(:feels_like)
    expect(forecast[:current]).to have_key(:pressure)
    expect(forecast[:current]).to have_key(:humidity)
    expect(forecast[:current]).to have_key(:dew_point)
    expect(forecast[:current]).to have_key(:uvi)
    expect(forecast[:current]).to have_key(:clouds)
    expect(forecast[:current]).to have_key(:visibility)
    expect(forecast[:current]).to have_key(:wind_speed)
    expect(forecast[:current]).to have_key(:wind_deg)
    expect(forecast[:current]).to have_key(:weather)
    expect(forecast[:current][:weather].first).to have_key(:id)
    expect(forecast[:current][:weather].first).to have_key(:main)
    expect(forecast[:current][:weather].first).to have_key(:description)
    expect(forecast[:current][:weather].first).to have_key(:icon)
  end

  it 'gets current hourly forecast for a given location' do
    lat = 51.5085
    lon = -0.1257

    forecast = WeatherService.get_weather_forecast(lat, lon)

    expect(forecast).to be_a(Hash)
    expect(forecast).to have_key(:minutely)
    expect(forecast[:minutely].first).to have_key(:dt)
  end
end