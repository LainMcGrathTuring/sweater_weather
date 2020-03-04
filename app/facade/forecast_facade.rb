class ForecastFacade

  attr_reader :id

  def initialize(params)
    @id = nil
    @location = params['location']
  end

  def location_results
    LocationFetcher.new.get_location(@location)
  end

  def forecast_response
    return @forecast if @forecast
    location = location_results
    @forecast = ForecastSummary.new(location)
  end

  def daily_weather_forecast
    forecast_response.daily_forecast
  end

  def hourly_weather_forecast
    forecast_response.hourly_forecast
  end

  def current_weather
    forecast_response.current_weather
  end
end
