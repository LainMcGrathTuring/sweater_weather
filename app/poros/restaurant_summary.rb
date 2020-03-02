class RestaurantSummary

  def self.restaurants_summary(params)
    return @restaurant if @restaurant
    @restaurant = YelpFetcher.new.get_business(params)
    Restaurant.new(@restaurant)
  end

end
