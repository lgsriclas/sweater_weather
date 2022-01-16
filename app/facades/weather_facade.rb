class WeatherFacade
  class << self
    def weather_forecast(location)
      city = MapFacade.coordinates(location)
      forecast = WeatherService.get_weather_forecast(city[:lat], city[:lon])
      Forecast.new(forecast)
    end
  end
end