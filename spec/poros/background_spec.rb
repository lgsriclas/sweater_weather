require 'rails_helper'

RSpec.describe 'Background', :vcr do
  it 'returns an image based on search params' do
    image = BackgroundFacade.image('hoboken,nj')

    expect(image.image).to be_a(Hash)
    expect(image.image).to have_key(:image_url)
    expect(image.image).to have_key(:credit)
    expect(image.image[:credit]).to have_key(:source)
    expect(image.image[:credit]).to have_key(:photographer)
    expect(image.image[:credit]).to have_key(:photographer_url)
    expect(image.image[:credit]).to_not have_key(:width)
    expect(image.image[:credit]).to_not have_key(:height)
  end
end