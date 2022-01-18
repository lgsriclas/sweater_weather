class BackgroundFacade
  class << self
    def image(location)
      data = BackgroundService.get_background(location)
      Background.new(data)
      # data[:photos].first[:locations].first[:latLng]
    end
  end
end