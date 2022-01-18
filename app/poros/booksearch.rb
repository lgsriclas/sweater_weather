class Booksearch
  attr_reader :id, :destination, :forecast, :book

  def initialize(location, weather, books)
    @id = nil
    @destination = location
    @forecast = get_forecast(weather)
    @books = book_search(books, quantity.to_i)
  end

  def get_forecast(weather)
    {
      summary: weather[:current][:weather].first[:description],
      temperature: weather[:current][:temp]
    }
  end

  def book_search(books, quantity)
    {
      total_books_found: books[:num_found],
      books: books[:docs]
    }
  end
end