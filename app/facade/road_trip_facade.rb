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
    LocationFetcher.new.get_distance(origin, destination)
  end

  def arrival_forecast
    ForecastFetcher.new.get_future_forecast(destination, distance.estimated_arrival_time)
  end
end
