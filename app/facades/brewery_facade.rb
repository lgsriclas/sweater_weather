class BreweryFacade
  class << self
    def breweries(location, quantity)
      breweries = BreweryService.get_breweries(location, quantity)
      # brewery_count = breweries[:data][0..(quantity.to_i -1)].map do |brewery|
      #   Brewery.new(brewery)
      # end
      location = MapFacade.coordinates(location)
      forecast = WeatherFacade.weather_forecast(location[:lat], location[:lng])
      x = Brewery.new(location, forecast, breweries)
    end
  end
end