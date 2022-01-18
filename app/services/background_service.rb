class BackgroundService
  class << self
    def get_location(location)
      response = Faraday.get("https://api.pexels.com/v1/search?key=#{ENV['pexels_api_key']}&query=#{location}&page=1&per_page=1")
      require "pry"; binding.pry
      parse_data(response)
    end

    private

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end