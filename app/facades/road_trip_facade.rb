class RoadTripFacade
  class << self
    def road_trip(origin, destination)
      time = MapService.get_travel_time(origin, destination)
      time_to_destination = time[:route][:legs].first[:time] / 3600
      coordinates = MapFacade.coordinates(destination)
      forecast = WeatherFacade.weather_forecast(coordinates[:lat], coordinates[:lng])
      future_forecast = forecast.hourly_weather[time_to_destination]
    end
  end
end