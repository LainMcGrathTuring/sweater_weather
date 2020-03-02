class RestaurantSummary

  def self.restaurants_summary(params)
    return @restaurants if @restaurants
    @restaurants = YelpFetcher.new.get_business(params)
  end

end
