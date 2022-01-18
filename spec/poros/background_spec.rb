require 'rails_helper'

RSpec.describe 'Background', :vcr do
  it 'returns an image based on search params' do
    image = BackgroundFacade.image('hoboken,nj')
  end
end