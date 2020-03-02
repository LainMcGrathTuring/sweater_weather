class ForecastSerializer
  include FastJsonapi::ObjectSerializer

  def self.generate_json(forecast)
    #five_day_forcast returns today's weather as well as the next 5 days
    #hourly_forcast returns the current hour's weather as well as the next 7 hours
    response = {
      location: forecast.location_results,
      image: forecast.image,
      weather: {
        current_weather: forecast.forecast_response.current_weather,
        hourly_forcast: forecast.forecast_response.hourly_forecast,
        five_day_forcast: forecast.forecast_response.daily_forecast
      }
    }
  end
end
