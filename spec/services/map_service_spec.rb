require 'rails_helper'

RSpec.describe 'Map Service', :vcr do
  it 'gets data for a given location' do
    data = MapService.get_location('Kansas City, KS')

    expect(data).to be_a(Hash)
    expect(data).to have_key(:info)
    expect(data).to have_key(:results)
    expect(data[:results].first).to have_key(:locations)
    expect(data[:results].first[:locations].first).to have_key(:adminArea5)
    expect(data[:results].first[:locations].first[:adminArea5]).to eq("Kansas City")
    expect(data[:results].first[:locations].first).to have_key(:adminArea3)
    expect(data[:results].first[:locations].first[:adminArea3]).to eq("KS")
  end
end