class BreweriesFacade
  class << self
    def breweries(location, quantity)
      breweries = BreweriesService.get_breweries(location, quantity)
      coordinates = MapFacade.coordinates(location)
      forecast = WeatherFacade.weather_forecast(coordinates[:lat], coordinates[:lng])
      Breweries.new(location, forecast, breweries)
    end
  end
end