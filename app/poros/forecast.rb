class Forecast
  attr_reader :id, :current_weather, :hourly_weather, :daily_weather

  def initialize(data)
    @id = nil
    @current_weather = current(data)
    @hourly_weather = hourly(data)
    @daily_weather = daily(data)
  end

  def current(data)
    {
      datetime: Time.at(data[:current][:dt]).strftime('%Y-%m-%d %H:%M'),
      sunrise: Time.at(data[:current][:sunrise]).strftime('%H:%M'),
      sunset: Time.at(data[:current][:sunset]).strftime('%H:%M'),
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
        hour: Time.at(time[:dt]).strftime('%H'),
        temperature: time[:temp],
        conditions: time[:weather].first[:description],
        icon: time[:weather].first[:icon],
      }
    end
  end

  def daily(data)
    data[:daily][0..4].map do |date|
      {
        day: Time.at(date[:dt]).strftime('%Y-%m-%d'),
        sunrise: Time.at(date[:sunrise]).strftime('%H:%M'),
        sunset: Time.at(date[:sunset]).strftime('%H:%M'),
        min: date[:temp][:min],
        max: date[:temp][:max],
        conditions: date[:weather].first[:description],
        icon: date[:weather].first[:icon],
      }
    end
  end
end