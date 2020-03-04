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
end
