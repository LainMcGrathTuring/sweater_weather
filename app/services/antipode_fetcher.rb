class AntipodeFetcher

  def get_antipode(location_coordinates)
    response = Faraday.get("http://amypode.herokuapp.com/api/v1/antipodes") do |req|
      req.headers['api_key'] = ENV['ANTIPODE']
      req.params['lat'] = location_coordinates.first
      req.params['long'] = location_coordinates.last
    end
    parse_response(response)
  end

  def parse_response(response)
    parse = JSON.parse(response.body, symbolize_names: true)
    get_city_name(parse[:data][:attributes].values)
  end

  def get_city_name(latlong_cords)
    response = Faraday.get("https://maps.googleapis.com/maps/api/geocode/json") do |req|
      req.params['latlng'] = "#{latlong_cords.first},#{latlong_cords.last}"
      req.params['key'] = ENV['GOOGLE_API']
    end
    parse_antipode(response)
  end

  def parse_antipode(response)
    parse = JSON.parse(response.body, symbolize_names: true)
    [parse[:results][0][:address_components][1][:long_name],
     parse[:results][0][:geometry][:location].values]
  end
end
