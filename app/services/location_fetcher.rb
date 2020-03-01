class LocationFetcher

  def connection
    Faraday.new("https://maps.googleapis.com")
  end

  def get_location(params)
    conn = connection
    response = conn.get("maps/api/geocode/json") do |req|
      req.params['address'] = params[:location]
      req.params['key'] = ENV['GOOGLE_API']
    end
    response_parse(response)
  end

  def response_parse(response)
    parse = JSON.parse(response.body, symbolize_names: true)
    Location.save_location(parse)
  end
end
