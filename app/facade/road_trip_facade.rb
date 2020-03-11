class RoadTripFacade
  attr_reader :id

  def initialize(start_location, end_location)
    @id = nil
    @start_location = start_location
    @end_location = end_location
  end

  def origin
    LocationFetcher.new.get_location(@start_location)
  end

  def destination
    LocationFetcher.new.get_location(@end_location)
  end

  def distance
    trip = LocationFetcher.new.get_distance(origin, destination)
    trip ? trip : "No routes found."
  end

  def arrival_forecast
    if distance == "No routes found."
      "Cannot fetch forecast without a route."
    else
      params = "#{destination.latitude},#{destination.longitude},#{distance.estimated_arrival_time}"
      ForecastFetcher.new.get_future_forecast(params)
    end
  end
end
