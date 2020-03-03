class LocationFetcher

  def connection
    Faraday.new("https://maps.googleapis.com")
  end

  def get_location(params)
    conn = connection
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

  def get_coordinates(location)
    conn = connection
    response = conn.get("maps/api/geocode/json") do |req|
      req.params['address'] = "#{location}"
      req.params['key'] = ENV['GOOGLE_API']
    end
    parse_location(response)
  end

  def parse_location(response)
    parse = JSON.parse(response.body, symbolize_names: true)
    parse[:results][0][:geometry][:location].values
  end

  def get_antipode_city_name(latlong_cords)
    response = Faraday.get("https://maps.googleapis.com/maps/api/geocode/json") do |req|
      req.params['latlng'] = "#{latlong_cords.first},#{latlong_cords.last}"
      req.params['key'] = ENV['GOOGLE_API']
    end
    parse_antipode(response)
  end

  def parse_antipode(response)
    parse = JSON.parse(response.body, symbolize_names: true)
    [parse[:results][0][:address_components][0][:long_name],
     parse[:results][0][:geometry][:location].values]
  end
end
