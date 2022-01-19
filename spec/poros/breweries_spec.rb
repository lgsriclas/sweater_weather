require 'rails_helper'

RSpec.describe 'Breweries', :vcr do
  it 'returns brewery and weather data' do
     breweries = BreweryFacade.breweries
  end

end