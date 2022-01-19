class Api::V1::BreweriesController < ApplicationController
  def index
    breweries = BreweryFacade.breweries(location, quantity)
    render json: BrewerySerializer.new(breweries)
  end
end