require 'rails_helper'

RSpec.describe 'Forecast', :vcr do
  it 'returns current weather forecast' do
    lat = 51.5085
    lon = -0.1257
    current = WeatherFacade.weather_forecast(lat, lon)

    expect(current.current_weather).to be_a(Hash)
    expect(current.current_weather).to have_key(:datetime)
    expect(current.current_weather).to have_key(:sunrise)
    expect(current.current_weather).to have_key(:sunset)
    expect(current.current_weather).to have_key(:temperature)
    expect(current.current_weather).to have_key(:feels_like)
    expect(current.current_weather).to have_key(:humidity)
    expect(current.current_weather).to have_key(:uvi)
    expect(current.current_weather).to have_key(:visibility)
    expect(current.current_weather).to have_key(:conditions)
    expect(current.current_weather).to have_key(:icon)
  end

  it 'returns hourly weather forecast' do
    lat = 51.5085
    lon = -0.1257
    current = WeatherFacade.weather_forecast(lat, lon)

    expect(current.hourly_weather.first).to be_a(Hash)
    expect(current.hourly_weather.first).to have_key(:hour)
    expect(current.hourly_weather.first).to have_key(:temperature)
    expect(current.hourly_weather.first).to have_key(:conditions)
    expect(current.hourly_weather.first).to have_key(:icon)
  end

  it 'returns daily weather forecast' do
    lat = 51.5085
    lon = -0.1257
    current = WeatherFacade.weather_forecast(lat, lon)

    expect(current.daily_weather.first).to be_a(Hash)
    expect(current.daily_weather.first).to have_key(:day)
    expect(current.daily_weather.first).to have_key(:sunrise)
    expect(current.daily_weather.first).to have_key(:sunset)
    expect(current.daily_weather.first).to have_key(:min)
    expect(current.daily_weather.first).to have_key(:max)
    expect(current.daily_weather.first).to have_key(:conditions)
    expect(current.daily_weather.first).to have_key(:icon)
  end
end