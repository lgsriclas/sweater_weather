require 'rails_helper'

RSpec.describe 'Booksearch Service', :vcr do
  it 'returns books based on location search' do
    location = 'denver,co'
    quantity = 5

    booksearch = BooksearchService.get_books(location, quantity)

    expect(booksearch).to be_a(Hash)
  end
end