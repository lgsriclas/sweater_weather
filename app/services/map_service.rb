class MapService
  class << self
    def get_location(location)
      response = Faraday.get("http://www.mapquestapi.com/geocoding/v1/address?key=#{ENV['mapquest_api_key']}&location=#{location}")
      parse_data(response)
    end

    def get_travel_time(origin, destination)
      response = Faraday.get("http://www.mapquestapi.com/directions/v2/route?key=#{ENV['mapquest_api_key']}&from=#{origin}&to=#{destination}")
      parse_data(response)
    end
    private

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end