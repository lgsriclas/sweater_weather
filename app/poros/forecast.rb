class Forecast
  attr_reader :id, :current_weather, :hourly_weather, :daily_weather

  def initialize(data)
    @id = nil
    @cw = current_weather(data[:current_weather])
    @hw = hourly_weather(data[:hourly_weather])
    @dw = daily_weather(data[:daily_weather])
  end

  def current_weather(data)
    {
      datetime: Time.at(data[:dt]),
      sunrise: Time.at(data[:sunrise]),
      sunset: Time.at(data[:sunset]),
      temperature: data[:temp],
      feels_like: data[:feels_like],
      humidity: data[:humidity],
      uvi: data[:uvi],
      visibility: data[:visibility],
      weather: data[:weather].first[:main],
      icon: data[:weather].first[:icon]
    }
  end

  def hourly_weather(data)
    data.map do |date|
      {
        time: Time.at(date[:dt]).strftime('%T'),
        temperature: date[:temp],
        icon: date[:weather].first[:icon]
      }
    end
  end

  def daily_weather(data)
    data.map do |date|
      {
        day: Time.at(date[:dt]).strftime('%F'),
        min: date[:temp][:min],
        max: date[:temp][:max],
        icon: date[:weather].first[:icon],
        rain: date[:rain]
      }
    end
  end
end