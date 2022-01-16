class WeatherService
  class << self
    def get_weather_forecast(lat, lon)
    #   # response = Faraday.get("https://api.openweathermap.org/data/2.5/onecall?lat={lat}&lon={lon}&exclude={part}&appid={ENV['weather_api_key']}")
    #   # response = Faraday.get("https://api.openweathermap.org/data/2.5/weather?q={city name}&APPID=e2cbde3f7bbfb18138fd03703757d36c")
      response = Faraday.get("https://api.openweathermap.org/data/2.5/onecall?appid=#{ENV['weather_api_key']}&lat=#{lat}&lon=#{lon}&units=imperial")
    #
      parse_data(response)
    end


    # def get_weather_forecast(lat, lon)
    #   url = 'onecall'
    #   params =
    #     {
    #       lat: lat,
    #       lon: lon,
    #       units: 'imperial',
    #       exclude: 'minutely,alerts',
    #       appid: ENV['weather_api_key']
    #     }
    #
    #     parse_data(url, params)
    #   # response = conn.get('onecall') do |x|
    #   #   x.params[:appid] = ENV['open_weather_api']
    #   #   x.params[:lat] = lat
    #   #   x.params[:lon] = lng
    #   #   x.params[:units] = 'imperial'
    #   # end
    #   # parse_data(response)
    # end

    private

    # def conn
    #   Faraday.new('https://api.openweathermap.org/data/2.5/')
    # end

    def parse_data(response)
      # JSON.parse(conn.get(url, params).body, symbolize_names: true)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end

