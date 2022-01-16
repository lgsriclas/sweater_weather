class Forecast
  attr_reader :id, :current_weather, :hourly_weather, :daily_weather

  def initialize(data)
    @id = nil
    @current_weather = current(data)
    @hourly_weather = hourly(data)
    @daily_weather = daily(data)
    # @current_weather =
    #   {
    #     datetime: Time.at(data[:current][:dt]),
    #     sunrise: Time.at(data[:current][:sunrise]),
    #     sunset: Time.at(data[:current][:sunset]),
    #     temperature: data[:current][:temp],
    #     feels_like: data[:current][:feels_like],
    #     humidity: data[:current][:humidity],
    #     uvi: data[:current][:uvi],
    #     visibility: data[:current][:visibility],
    #     conditions: data[:current][:weather].first[:main],
    #     icon: data[:current][:weather].first[:icon]
    #   }
    # @hourly_weather =
    #   data[:hourly][0..7].map do |time|
    #     {
    #       day: Time.at(time[:dt]).strftime('%F'),
    #       temperature: time[:temp],
    #       conditions: time[:weather].first[:main],
    #       icon: time[:weather].first[:icon],
    #     }
    #   end
    # @daily_weather =
    #   data[:daily][0..4].map do |date|
    #     {
    #       time: Time.at(date[:dt]).strftime('%F'),
    #       min: date[:temp][:min],
    #       max: date[:temp][:max],
    #       icon: date[:weather].first[:icon],
    #       rain: date[:rain]
    #     }
    #   end
  end

  def current(data)
    {
      datetime: Time.at(data[:current][:dt]),
      sunrise: Time.at(data[:current][:sunrise]),
      sunset: Time.at(data[:current][:sunset]),
      temperature: data[:current][:temp],
      feels_like: data[:current][:feels_like],
      humidity: data[:current][:humidity],
      uvi: data[:current][:uvi],
      visibility: data[:current][:visibility],
      conditions: data[:current][:weather].first[:main],
      icon: data[:current][:weather].first[:icon]
    }
  end

  def hourly(data)
    data[:hourly][0..7].map do |time|
      {
        day: Time.at(time[:dt]).strftime('%F'),
        temperature: time[:temp],
        conditions: time[:weather].first[:main],
        icon: time[:weather].first[:icon],
      }
    end
  end

  def daily(data)
    data[:daily][0..4].map do |date|
      {
        time: Time.at(date[:dt]).strftime('%F'),
        min: date[:temp][:min],
        max: date[:temp][:max],
        icon: date[:weather].first[:icon],
        rain: date[:rain]
      }
    end
  end
end