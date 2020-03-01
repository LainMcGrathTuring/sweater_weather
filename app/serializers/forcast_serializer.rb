class ForcastSerializer
  include FastJsonapi::ObjectSerializer

  def self.generate_json(forcast)
    require "pry"; binding.pry
    response = {
      location: forcast.location,
      weather: {
        current_weather: forcast.forcast_response.current_weather,
        
      }
    }
  end
end
