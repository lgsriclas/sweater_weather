class BreweryService
  class << self
    def get_breweries(location, quantity)
      response = Faraday.get("https://api.openbrewerydb.org/breweries/search?query=#{location}&limit=#{quantity}")
      parse_data(response)
    end

    private

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end