class BreweriesFacade
  class << self
    def breweries(location, quantity)
      breweries = BreweriesService.get_breweries(location, quantity)
      location = MapFacade.coordinates(location)
      forecast = WeatherFacade.weather_forecast(location[:lat], location[:lng])
      Breweries.new(location, forecast, breweries)
    end
  end
end