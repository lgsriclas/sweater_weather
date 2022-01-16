require 'rails_helper'

RSpec.describe 'Weather API', :vcr do
  it 'returns weather forecast for city' do
    # get '/api/v1/forecast?location=hoboken,nj'
    #
    # expect(response).to be_successful
    get '/api/v1/forecast?location=denver,co',
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }

    expect(response).to be_successful
    expect(response.status).to eq 200

    # forecast = JSON.parse(response.body, symbolize_names: true)
    #
    # expect(forecast).to be_a(Hash)
  end
end