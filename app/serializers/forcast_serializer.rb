class ForcastSerializer
  include FastJsonapi::ObjectSerializer

  def self.generate_json(forcast)
    #five_day_forcast returns today's weather as well as the next 5 days
    #hourly_forcast returns the current hour's weather as well as the next 7 hours
    response = {
      location: forcast.location,
      weather: {
        current_weather: forcast.forcast_response.current_weather,
        five_day_forcast: forcast.forcast_response.daily_forcast,
        hourly_forcast: forcast.forcast_response.hourly_forcast
      }
    }
  end
end
