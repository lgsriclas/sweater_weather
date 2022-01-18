class Api::V1::BooksearchController < ApplicationController
  def index
    # location = MapFacade.coordinates(params[:location])
    # forecast = WeatherFacade.weather_forecast(location[:lat], location[:lng])
    # forecast = WeatherFacade.weather_forecast(params[:destination])
    books = BooksearchFacade.books(params[:location], params[:quantity].to_i)
    render json: BooksearchSerializer.new(books)
  end
end