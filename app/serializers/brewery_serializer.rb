class BrewerySerializer
  include JSONAPI::Serializer

  set_type :brewery
  attributes :destination, :forecast, :breweries
end