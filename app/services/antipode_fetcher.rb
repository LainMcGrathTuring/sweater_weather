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
    LocationFetcher.new.get_antipode_city_name(parse[:data][:attributes].values)
  end
end
