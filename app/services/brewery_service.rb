class BreweryService
  class << self
    def get_breweries(location)
      response = Faraday.get("https://api.openbrewerydb.org/breweries?by_city=#{location}")
      parse_data(response)
    end

    private

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end