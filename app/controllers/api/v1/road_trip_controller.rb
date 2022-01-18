class Api::V1::RoadTripController < ApplicationController
  def create
    # time = MapService.get_travel_time(params[:origin], params[:destination])
    # travel_time = time[:formattedTime]
    # lat = MapService.get_location(params[:destination])[:latLng][:lat]
    # lon = MapService.get_location(params[:destination])[:latLng][:lat]
    # hourly_weather = WeatherService.get_weather_forecast(lat, lon)
    # road_trip =
    #   {
    #     origin: params[:origin],
    #     destination: params[:destination],
    #     travel_time: travel_time,
    #     weather_at_eta: {
    #       temperature: hourly_weather[:temp],
    #       conditions: hourly_weather[:weather][0][:description]}
    #   }
    # RoadTrip.new(road_trip)
    road_trip = RoadTripFacade.road_trip(params[:origin], params[:destination])

    render json: RoadTripSerializer.new(road_trip)
  end

  def road_trip_params
    params.permit(:origin, :destination, :api_key)
  end
end