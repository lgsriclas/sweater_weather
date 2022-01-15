class WeatherService
  class << self
    def weather_forecast(lat, lon)
      response = Faraday.get("https://api.openweathermap.org/data/2.5/onecall?lat={lat}&lon={lon}&exclude={part}&appid={ENV['weather_api_key']}")
      parse_data(response)
    end
  end
end

private

def parse_data(response)
  JSON.parse(response.body, symbolize_names: true)
end