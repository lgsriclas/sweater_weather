class Api::V1::BreweriesController < ApplicationController
  def index
    breweries = BreweryFacade.breweries(params[:location])
    render json: BrewerySerializer.new(breweries)
  end
end