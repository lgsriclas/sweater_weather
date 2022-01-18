class WeatherFacade
  class << self
    def weather_forecast(lat, lon)
      forecast = WeatherService.get_weather_forecast(lat, lon)
      Forecast.new(forecast)
    end
  end
end