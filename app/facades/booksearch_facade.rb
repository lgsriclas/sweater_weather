class BooksearchFacade
  class << self
    def books(location, quantity = '5')
      # forecast = WeatherFacade.weather_forecast(location[:lat], location[:lng])
      # weather = {summary: forecast[:conditions], temperature: forecast[:temperature].to_i}
      books = BooksearchService.get_books(location, quantity)
      location = MapFacade.coordinates(location)
      weather = WeatherFacade.weather_forecast(location[:lat], location[:lng])
      Booksearch.new(location, weather, books)
    end
  end
end