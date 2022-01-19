class Brewery
  attr_reader :id,
              :destination,
              :forecast,
              :breweries

  def initialize(destination, forecast, breweries)
    @id = nil
    @destination = destination
    @forecast = get_forecast(forecast)
    @breweries = brewery_search(breweries[:data])
  end

  def get_forecast(forecast)
    {
      summary: forecast.current_weather[:conditions],
      temperature: forecast.current_weather[:temperature].to_s + " F"
    }
  end

  def brewery_search(breweries)
    breweries.map do |brewery|
      {
        id: brewery[:id],
        name: brewery[:name],
        brewery_type: brewery[:brewery_type]
      }
    end 
  end
end