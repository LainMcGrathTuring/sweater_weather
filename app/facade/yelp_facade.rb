class YelpFacade
  attr_reader :all_restaurants, :start, :destination

  def initialize(params)
    @all_restaurants = RestaurantSummary.restaurants_summary(params)
    @start = LocationFetcher.new.get_location(params[:start])
    @destination = LocationFetcher.new.get_location(params[:end])
    @distance = LocationFetcher.new.get_distance(start, destination)
  end

  
end
