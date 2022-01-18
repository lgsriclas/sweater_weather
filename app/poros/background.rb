class Background
  attr_reader :id, :image

  def initialize(data)
    @id = nil
    @image = background_image(data)
  end

  def background_image(data)
    {
      # location: data[:location],
      image_url: data[:photos].first[:url],
      credit:
        {
          source: 'pexels.com',
          photographer: data[:photos].first[:photographer],
          photographer_url: data[:photos].first[:photographer_url]

        }
    }

  end
end