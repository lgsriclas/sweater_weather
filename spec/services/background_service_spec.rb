require 'rails_helper'

RSpec.describe 'Background Service', :vcr do
  it 'returns an image based on search parameters' do
    background = BackgroundService.get_background('hoboken,nj')

    expect(background).to be_a(Hash)
    expect(background).to have_key(:page)
    expect(background[:page]).to eq(1)
    expect(background).to have_key(:per_page)
    expect(background[:per_page]).to eq(1)
    expect(background).to have_key(:photos)
    expect(background[:photos].first).to have_key(:photographer)
    expect(background[:photos].first[:photographer]).to eq("Sanaan Mazhar")
  end
end