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
    @travel_time = data[:travel_time].to_s + " Hours"
    @weather_at_eta = data[:weather_at_eta]
  end
end