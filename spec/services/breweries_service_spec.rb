require 'rails_helper'

RSpec.describe 'Breweries Service', :vcr do
  it 'returns brewery info based on location search' do
    breweries = BreweriesService.get_breweries('Denver, CO', 5)

    expect(breweries).to be_an(Array)
    expect(breweries.first).to be_a(Hash)
    expect(breweries.first).to have_key(:id)
    expect(breweries.first[:id]).to eq("denver-beer-co-denver")
    expect(breweries.first).to have_key(:name)
    expect(breweries.first[:name]).to eq("Denver Beer Co")
    expect(breweries.first).to have_key(:brewery_type)
    expect(breweries.first[:brewery_type]).to eq("micro")
    expect(breweries.first).to have_key(:city)
    expect(breweries.first).to have_key(:state)
  end
end