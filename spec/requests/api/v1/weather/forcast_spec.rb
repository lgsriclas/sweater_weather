require 'rails_helper'

RSpec.describe 'Weather API' do
  it 'returns weather forcast for city' do
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    forcast = JSON.parse(response.body, symbolize_names: true)

    expect(forcast).to be_a(Hash)
  end
end