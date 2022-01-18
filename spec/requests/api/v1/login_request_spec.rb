require 'rails_helper'

RSpec.describe 'User Login', :vcr do
  it 'returns user data' do
    User.create(email: 'sally@peanuts.com', password: 'ilovelinus', password_confirmation: 'ilovelinus')

    user_data =
      {
        email: 'sally@peanuts.com',
        password: 'ilovelinus',
      }

    post '/api/v1/sessions', params: user_data.to_json,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }
    expect(response).to be_successful
    expect(response.status).to eq(201)

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user).to have_key(:data)
    expect(user[:data]).to have_key(:id)
    expect(user[:data]).to have_key(:type)
    expect(user[:data]).to have_key(:attributes)
    expect(user[:data][:attributes]).to have_key(:email)
    expect(user[:data][:attributes]).to have_key(:api_key)
    expect(user[:data][:attributes]).to_not have_key(:password)
    expect(user[:data][:attributes]).to_not have_key(:password_digest)
  end
end