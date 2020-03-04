class LocationFetcher

  def conn
    Faraday.new("https://maps.googleapis.com")
  end

  def get_location(params)
    response = conn.get("maps/api/geocode/json") do |req|
      req.params['address'] = "#{params}"
      req.params['key'] = ENV['GOOGLE_API']
    end
    location_parse(response)
  end

  def location_parse(response)
    parse = JSON.parse(response.body, symbolize_names: true)
    Location.save_location(parse)
  end

  def get_distance(origin, destination)
    response = conn.get("maps/api/directions/json") do |req|
      req.params['origin'] = "#{origin.latitude}, #{origin.longitude}"
      req.params['destination'] = "#{destination.latitude}, #{destination.longitude}"
      req.params['key'] = ENV['GOOGLE_API']
    end
    distance_parse(response)
  end

  def distance_parse(response)
    parse = JSON.parse(response.body, symbolize_names: true)
    if parse[:routes][0]
      Trip.new(parse[:routes][0][:legs][0])
    end
  end
end
