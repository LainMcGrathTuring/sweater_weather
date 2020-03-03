class AntipodeFacade

  attr_reader :search_location,
              :type,
              :id

  def initialize(location)
    @id = nil
    @search_location = location
    @type = "antipode"
  end

  def starting_location_coordinates
    LocationFetcher.new.get_coordinates(@search_location)
  end

  def location_info
    location_cords = starting_location_coordinates
    AntipodeFetcher.new.get_antipode(location_cords)
  end

  def location_name
    location_info.first
  end

  def forecast
    antipode = location_info.second
    ForecastFetcher.new.get_forecast(antipode)
  end
end
