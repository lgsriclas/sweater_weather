require 'rails_helper'

RSpec.describe 'Pexels API', :vcr do
  it 'returns an image based on search parameters' do
    get '/api/v1/backgrounds?location=hoboken,nj',

    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }

    expect(response).to be_successful
    expect(response.status).to eq 200
  end
end