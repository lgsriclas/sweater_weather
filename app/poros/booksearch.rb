class Booksearch
  attr_reader :id, :destination, :forecast, :total_books_found, :books

  def initialize(destination, forecast, books)
    @id = nil
    @destination = destination
    @forecast = get_forecast(forecast)
    @total_books_found = books[:num_found]
    @books = book_search(books[:docs])
  end

  def get_forecast(forecast)
    {
      summary: forecast.current_weather[:conditions],
      temperature: forecast.current_weather[:temperature].to_s + ' F'
    }
  end

  def book_search(books)
    books.map do |book|
      {
        isbn: book[:isbn],
        title: book[:title],
        publisher: book[:publisher]
      }
    end
  end
end