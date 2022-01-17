class WeatherFacade
  class << self
    def weather_forecast(lat, lon)
      # location = MapFacade.coordinates(params[:location])
      # city = MapFacade.coordinates(location)
      forecast = WeatherService.get_weather_forecast(lat, lon)
      Forecast.new(forecast)
    end
  end
end