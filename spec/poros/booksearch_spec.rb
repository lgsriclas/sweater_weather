require 'rails_helper'

RSpec.describe 'Book search', :vcr do
  it 'returns books based on location search' do

    booksearch = Booksearch.new('Hoboken, NJ', @forecast, @books)

    expect(booksearch).to be_a(Booksearch)
    # expect(booksearch).to have_key[:id]
    # expect(booksearch[:id]).to eq(nil)
  end
end