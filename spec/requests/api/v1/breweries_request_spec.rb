require 'rails_helper'

RSpec.describe 'Breweries Request', :vcr do
  it 'returns brewery and weather data based on location search' do
    get '/api/v1/breweries?location=denver,co&quantity=5',
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }

    expect(response).to be_successful
    expect(response.status).to eq(200)

    breweries = JSON.parse(response.body, symbolize_names: true)

    expect(breweries).to be_a(Hash)
  end
end