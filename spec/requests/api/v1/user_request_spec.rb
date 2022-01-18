require 'rails_helper'

RSpec.describe 'Users API' do
  it 'returns user data' do
    user_data =
      {
        email: 'charlie@peanuts.com',
        password: 'ilovesnoopy',
        password_confirmation: 'ilovesnoopy'
      }

      post '/api/v1/users', params: user_data.to_json,
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

  it 'returns an error code if registration is unsuccessful' do
    user_data =
      {
        email: 'charlie@peanuts.com',
        password: 'ilovesnoopy',
        password_confirmation: 'ilovelucy'
      }

      post '/api/v1/users', params: user_data.to_json,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }

      data = JSON.parse(response.body, symbolize_names: true)[:errors]

      expect(response.status).to eq(400)
      expect(data[:details]).to eq('There was an error completing this request.')
  end
end