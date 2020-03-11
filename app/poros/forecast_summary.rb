class ForecastSummary

  attr_reader :response

  def initialize(location)
    params = "#{location.latitude},#{location.longitude}"
    @response ||= ForecastFetcher.new.get_forecast(params)
  end

  def current_weather
    CurrentForecastSummary.new(response[:currently])
  end

  def daily_forecast
    DailyForecast.next_five_days(response[:daily])
  end

  def hourly_forecast
    HourlyForecast.hourly_forecast(response[:hourly])
  end
end
