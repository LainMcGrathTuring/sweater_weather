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
    if trip != nil
      trip
    else
      "no routes found"
    end
  end

  def arrival_forecast
    if distance == "no routes found"
      "cannot fetch forecast without a route"
    else
      ForecastFetcher.new.get_future_forecast(destination, distance.estimated_arrival_time)
    end
  end
end
