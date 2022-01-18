require 'rails_helper'

RSpec.describe 'Weather Facade', :vcr do
  it 'returns weather forecast data' do
    lat = 51.5085
    lon = -0.1257

    forecast = WeatherFacade.weather_forecast(lat, lon)

    expect(forecast).to be_an_instance_of(Forecast)
    expect(forecast.current_weather).to be_a(Hash)
    expect(forecast.hourly_weather).to be_an(Array)
    expect(forecast.daily_weather).to be_an(Array)
    expect(forecast.hourly_weather.count).to eq(8)
    expect(forecast.daily_weather.count).to eq(5)
  end
end