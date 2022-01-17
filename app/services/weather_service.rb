class WeatherService
  class << self
    def get_weather_forecast(lat, lon)
      response = Faraday.get("https://api.openweathermap.org/data/2.5/onecall?appid=#{ENV['weather_api_key']}&lat=#{lat}&lon=#{lon}&units=imperial")
      parse_data(response)
    end

    private
    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end

