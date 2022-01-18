class BackgroundFacade
  class << self
    def image(location)
      data = BackgroundService.get_background(location)
      Background.new(data)
    end
  end
end