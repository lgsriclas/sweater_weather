class Api::V1::RoadTripController < ApplicationController
  def create
    if params[:api_key] == ""
      render json: {errors: {details: "Your API key is incorrect"}}, status: 401
    else
      road_trip = RoadTripFacade.road_trip(params[:origin], params[:destination])
      render json: RoadTripSerializer.new(road_trip)
    end
  end

  private

  def road_trip_params
    params.permit(:origin, :destination, :api_key)
  end
end