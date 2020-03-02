class ForecastFacade

  attr_reader :location_results, :forecast_response, :image

  def initialize(params)
    @location_results = LocationFetcher.new.get_location(params)
    @forecast_response = ForecastSummary.new(location_results)
    @image = ImageSummary.new(location_results).single_image
  end

  #call serializer here
  def forecast_serializer
    ForecastSerializer.generate_json(self)
  end
end
