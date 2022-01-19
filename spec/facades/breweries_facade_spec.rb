require 'rails_helper'

RSpec.describe 'Breweries Facade', :vcr do
  it 'returns brewery data' do
     breweries = BreweriesFacade.breweries("Denver, CO", 5)

     expect(breweries.breweries).to be_an(Array)
     expect(breweries.breweries.first).to be_a(Hash)
     expect(breweries.breweries.first).to have_key(:id)
     expect(breweries.breweries.first[:id]).to eq("denver-beer-co-denver")
     expect(breweries.breweries.first).to have_key(:name)
     expect(breweries.breweries.first[:name]).to eq("Denver Beer Co")
     expect(breweries.breweries.first).to have_key(:brewery_type)
     expect(breweries.breweries.first[:brewery_type]).to eq("micro")
     expect(breweries.breweries.first).to_not have_key(:city)
     expect(breweries.breweries.first).to_not have_key(:state)
  end

  it 'returns weather data' do
     breweries = BreweriesFacade.breweries("Denver, CO", 5)

     expect(breweries.forecast).to be_a(Hash)
     expect(breweries.forecast).to have_key(:summary)
     expect(breweries.forecast).to have_key(:temperature)
  end

  it 'returns location data' do
     breweries = BreweriesFacade.breweries("Denver, CO", 5)

     expect(breweries.destination).to eq("Denver, CO")
  end
end