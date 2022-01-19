class BreweryFacade
  class << self
    def breweries(location)
      breweries = BreweryService.get_breweries(location)
      location = MapFacade.coordinates(location)
      weather = WeatherFacade.weather_forecast(location[:lat], location[:lng])
      Brewery.new(location, weather, breweries)
    end
  end
end