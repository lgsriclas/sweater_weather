class BrewerySerializer
  include JSONAPI::Serializer

  set_type :brewery
  attributes :destinatio, :forecast, :breweries
end