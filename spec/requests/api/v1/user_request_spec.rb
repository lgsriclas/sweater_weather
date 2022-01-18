require 'rails_helper'

RSpec.describe 'Users API' do
  it 'returns user data' do
    data =
      {
        email: 'charlie@peanuts.com',
        password: 'ilovesnoopy',
        password_confirmation: 'ilovesnoopy'
      }

      post '/api/v1/users', params: data.to_json,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }

      expect(response).to be_successful
      # expect(response.status).to eq(201)

      user = JSON.parse(response.body, symbolize_names: true)

      expect(user).to have_key(:data)
  end
end