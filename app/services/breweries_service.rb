class MapService
  class << self
    def get_location(location)
      response = Faraday.get("https://api.openbrewerydb.org/breweries/search?#{location}&limit=#{quantity}")
      parse_data(response)
    end

    private

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end