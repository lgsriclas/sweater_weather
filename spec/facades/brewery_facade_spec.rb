require 'rails_helper'

RSpec.describe 'Breweries Facade', :vcr do
  it 'gets brewery and weather data' do
    breweries = BreweryFacade.breweries("Denver, CO", 5)

    expect(breweries.first).to be_a(Hash)
  end
end