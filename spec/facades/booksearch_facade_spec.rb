require 'rails_helper'

RSpec.describe 'Booksearch Facade', :vcr do
  it 'returns books for a given location' do

    books = BooksearchFacade.books('hoboken,nj', 4)

    expect(books).to be_a(Booksearch)
    expect(books).to have_key(:id)
    expect(books.id).to eq(nil)
  end
end