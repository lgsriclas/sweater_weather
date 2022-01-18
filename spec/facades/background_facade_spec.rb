require 'rails_helper'

RSpec.describe 'Background Facade', :vcr do
  it 'returns an image based on search params' do
    image = BackgroundFacade.image('hoboken,nj')

    expect(image).to be_a(Background)
    expect(image.image).to have_key(:image_url)
    expect(image.image[:image_url]).to eq("https://www.pexels.com/photo/scenic-photo-of-city-during-evening-2977527/")
    expect(image.image).to have_key(:credit)
    expect(image.image[:credit]).to have_key(:source)
    expect(image.image[:credit][:source]).to eq("pexels.com")
    expect(image.image[:credit]).to have_key(:photographer)
    expect(image.image[:credit][:photographer]).to eq("Sanaan Mazhar")
    expect(image.image[:credit]).to have_key(:photographer_url)
    expect(image.image[:credit][:photographer_url]).to eq("https://www.pexels.com/@sanaan")
    expect(image.image[:credit]).to_not have_key(:width)
    expect(image.image[:credit]).to_not have_key(:height)
  end
end