class LocationFetcher

  def conn
    Faraday.new("https://maps.googleapis.com")
  end

  def get_location(params)
    response = conn.get("maps/api/geocode/json") do |req|
      req.params['address'] = "#{params}"
      req.params['key'] = ENV['GOOGLE_API']
    end
    data = location_parse(response)
    Location.save_location(data)
  end

  def location_parse(response)
    parse = JSON.parse(response.body, symbolize_names: true)
  end

  def get_distance(origin, destination)
    response = conn.get("maps/api/directions/json") do |req|
      req.params['origin'] = "#{origin.latitude}, #{origin.longitude}"
      req.params['destination'] = "#{destination.latitude}, #{destination.longitude}"
      req.params['key'] = ENV['GOOGLE_API']
    end
    data = location_parse(response)
    trip(data)
  end

  def trip(data)
    Trip.new(data[:routes][0][:legs][0][:duration]) if data[:routes][0]
  end
end
