require 'rails_helper'

RSpec.describe 'Book Search', :vcr do
  it 'returns books based on search parameters' do
    get '/api/v1/book-search?location=hoboken,nj&quantity=5',
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }

  end
end