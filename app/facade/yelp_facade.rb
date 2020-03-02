class YelpFacade
  attr_reader :restaurant,
              :destination,
              :forecast,
              :distance,
              :trip_details,
              :type,
              :arrival_forecast

  def initialize(params)
    @restaurant = RestaurantSummary.restaurants_summary(params)
    start = LocationFetcher.new.get_location(params[:start])
    @destination = LocationFetcher.new.get_location(params[:end])
    @trip_details = LocationFetcher.new.get_distance(start, destination)
    @arrival_forecast = ArrivalForecast.new.find_arrival_forecast(destination, trip_details)
    @type = params["controller"].split("api/v1/").last
  end

  def yelp_serializer
    YelpSerializer.generate_json(self)
  end
end
