class Api::V1::BreweriesController < ApplicationController
  def index
    if params[:quantity].to_i > 0
      breweries = BreweryFacade.breweries(params[:location], params[:quantity])
      render json: BrewerySerializer.new(breweries)
    else
      render json: {errors: {details: "Please enter a quantity greater than 0."}}, status: 400
    end 
  end
end