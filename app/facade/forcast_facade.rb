class ForcastFacade

  attr_reader :location, :forcast_response

  def initialize(params)
    @location = LocationFetcher.new.get_location(params)
    @forcast_response = ForcastSummary.new(location)
  end

  #call serializer here
  def forcast_serializer
    ForcastSerializer.generate_json(self)
  end
end
