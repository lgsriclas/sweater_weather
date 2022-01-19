class BreweryService
  class << self
    def get_brewery(location)
      response = Faraday.get("https://api.openbrewerydb.org/breweries?by_city=#{city}")
      parse_data(response)
    end

    private

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end