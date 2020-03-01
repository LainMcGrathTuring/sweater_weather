class ForcastSerializer
  include FastJsonapi::ObjectSerializer

  def self.generate_json(forcast)
    #five_day_forcast returns today's weather as well as the next 5 days
    response = {
      location: forcast.location,
      weather: {
        current_weather: forcast.forcast_response.current_weather,
        five_day_forcast: forcast.forcast_response.daily_forcast
      }
    }
  end
end
