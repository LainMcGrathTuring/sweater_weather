class AntipodeFacade

  attr_reader :start_location_coords,
              :search_location,
              :type,
              :id

  def initialize(location)
    @id = nil
    @search_location = location
    @type = "antipode"
    @start_cord = LocationFetcher.new.get_coordinates(@search_location)
  end

  def starting_location_coordinates
    LocationFetcher.new.get_coordinates(@search_location)
  end

  def antipode
    AntipodeFetcher.new.get_antipode(@start_cord)
  end
end
