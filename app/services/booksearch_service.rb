class BooksearchService
  class << self
    def get_books(location, quantity)
      response = Faraday.get("http://openlibrary.org/search.json?q=#{location}&limit=#{quantity}")
      parse_data(response)
    end

    private
    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end