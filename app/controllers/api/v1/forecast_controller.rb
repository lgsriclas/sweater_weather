class Api::V1::ForecastController < ApplicationController
  def index
    # if params[:location].present?
      location = MapFacade.coordinates(params[:location])
      forecast = WeatherFacade.weather_forecast(location[:lat], location[:lng])
      render json: ForecastSerializer.new(forecast)
    # end
  end
end