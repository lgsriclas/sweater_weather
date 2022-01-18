require 'rails_helper'

RSpec.describe 'Book Search API', :vcr do
  it 'returns books based on search parameters' do
    get '/api/v1/book-search?location=hoboken,nj&limit=5',
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }

    expect(response).to be_successful
    expect(response.status).to eq(200)

    book = JSON.parse(response.body, symbolize_names: true)

    expect(book).to be_a(Hash)
    expect(book).to have_key(:data)
  end
end