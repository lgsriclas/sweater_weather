class BreweryFacade
  class << self
    def breweries(location, quantity)
      breweries = BreweryService.get_breweries(location, quantity)
      coordinates = MapFacade.coordinates(location)
      forecast = WeatherFacade.weather_forecast(coordinates[:lat], coordinates[:lng])
      Brewery.new(location, forecast, breweries)
    end
  end
end