class BooksearchFacade
  class << self
    def books(location, quantity)
      # forecast = WeatherFacade.weather_forecast(location[:lat], location[:lng])
      # weather = {summary: forecast[:conditions], temperature: forecast[:temperature].to_i}
      location = MapFacade.coordinates(params[:location])
      books = BooksearchService.get_books(location, quantity)
      weather = WeatherFacade.weather_forecast(location[:latLng][:lat], location[:latLng][:lng])
      Booksearch.new(location, weather, books)
    end
  end
end