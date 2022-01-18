require 'rails_helper'

RSpec.describe 'Book search', :vcr do
  it 'returns books based on location search' do
    location = 'denver,co'
    weather = { summary: 'clear skies', temp: 32.32}
    books = { total_books_found: 41219, books: 5}

    booksearch = Booksearch.new(location, weather, books)

    expect(booksearch).to be_a(Booksearch)
    expect(booksearch).to have_key[:id]
    expect(booksearch[:id]).to eq(nil)
  end
end