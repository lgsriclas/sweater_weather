require 'rails_helper'

RSpec.describe 'Booksearch Service', :vcr do
  it 'returns books based on location search' do
    location = 'Hoboken, NJ'
    quantity = 5

    booksearch = BooksearchService.get_books(location, quantity)

    expect(booksearch).to be_a(Hash)
    expect(booksearch).to have_key(:numFound)
    expect(booksearch[:numFound]).to eq(163)
    expect(booksearch).to have_key(:docs)
  end
end