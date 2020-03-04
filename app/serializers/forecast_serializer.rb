class ForecastSerializer
  include FastJsonapi::ObjectSerializer
    attributes :location_results,
               :daily_weather_forecast,
               :hourly_weather_forecast,
               :current_weather

end
