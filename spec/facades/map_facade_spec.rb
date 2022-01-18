require 'rails_helper'

RSpec.describe 'Map Facade', :vcr do
  it 'gets coordinates for a given location' do
    coordinates = MapFacade.coordinates('Hoboken, NJ')

    expect(coordinates).to be_a(Hash)
    expect(coordinates).to have_key(:lat)
    expect(coordinates).to have_key(:lng)
    expect(coordinates[:lat]).to eq(40.743464)
    expect(coordinates[:lng]).to eq(-74.029065)
  end
end