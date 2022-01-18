class Booksearch
  attr_reader :id, :destination, :forecast, :book

  def initialize(location, weather, books)
    @id = nil
    @destination = location
    @forecast = get_forecast(weather)
    @book = book_search(book)
  end

  def get_forecast(weather)
    {
      summary: data[:current][:weather].first[:description],
      temperature: data[:current][:temp]
    }
  end

  def book_search(book)
    {
      total_books_found: data[:num_found],
      books: data[:docs].limit(5)
    }
  end
end