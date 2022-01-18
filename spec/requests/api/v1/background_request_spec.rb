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

    background = JSON.parse(response.body, symbolize_names: true)

    expect(background).to be_a(Hash)
    expect(background).to have_key(:data)
    expect(background[:data]).to have_key(:attributes)
    expect(background[:data][:attributes]).to have_key(:image)
    expect(background[:data][:attributes][:image]).to have_key(:image_url)
    expect(background[:data][:attributes][:image]).to have_key(:credit)
    expect(background[:data][:attributes][:image][:credit]).to have_key(:source)
    expect(background[:data][:attributes][:image][:credit]).to have_key(:photographer)
    expect(background[:data][:attributes][:image][:credit]).to have_key(:photographer_url)
    expect(background[:data][:attributes][:image][:credit]).to_not have_key(:width)
    expect(background[:data][:attributes][:image][:credit]).to_not have_key(:height)
  end
end