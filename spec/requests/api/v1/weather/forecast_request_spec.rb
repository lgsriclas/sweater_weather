require 'rails_helper'

RSpec.describe 'Weather API' do
  it 'returns weather forecast for city' do
    get '/api/v1/forecast?location=hoboken,nj'

    expect(response).to be_successful

    forecast = JSON.parse(response.body, symbolize_names: true)

    expect(forecast).to be_a(Hash)
  end
end