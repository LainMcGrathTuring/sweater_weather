class ArrivalForecast

  def find_arrival_forecast(destination, trip_details)
    forecasts = ForecastSummary.new(destination).hourly_forecast
    forecasts.find do |f|
      f.time == trip_details.arrival_time
    end
  end
end
