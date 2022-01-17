class MapFacade
  class << self
    def coordinates(location)
      data = MapService.get_location(location)
      data[:results].first[:locations].first[:latLng]
    end
  end
end