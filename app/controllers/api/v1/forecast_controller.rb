class Api::V1::ForecastController < ApplicationController
  def index
    if params[:location].present?
      forecast = WeatherFacade.weather_forecast
      # render json: ForecastSerializer.new
    end
  end
end