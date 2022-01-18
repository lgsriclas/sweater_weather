class RoadTrip
  attr_reader :id,
              :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta

  def initialize(data)
    @id = nil
    @start_city = data[:origin]
    @end_city = data[:destination]
    @travel_time = Time.at(data[:travel_time]).strftime('%H hours,%M minutes')
    @weather_at_eta = data[:weather_at_eta]
  end
end