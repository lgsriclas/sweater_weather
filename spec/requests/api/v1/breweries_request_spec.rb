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
    expect(breweries).to have_key(:data)
    expect(breweries[:data]).to have_key(:attributes)
    expect(breweries[:data][:attributes]).to have_key(:destination)
    expect(breweries[:data][:attributes]).to have_key(:forecast)
    expect(breweries[:data][:attributes]).to have_key(:breweries)
  end

  it 'sends an error code if quantity is 0 or less' do
    get '/api/v1/breweries?location=denver,co&quantity=-1',
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
  end
end