require 'rails_helper'

RSpec.describe 'Breweries Service', :vcr do
  it 'returns brewery info based on location search' do
    breweries = BreweriesService.get_breweries('Denver, CO', 5)

    expect(breweries).to be_a(Hash)
  end
end