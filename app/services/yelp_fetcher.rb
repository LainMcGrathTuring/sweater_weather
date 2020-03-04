class YelpFetcher

  def conn
    Faraday.new("https://api.yelp.com/v3/")
  end

  def get_business(params)
    response = conn.get("businesses/search") do |req|
      req.params['location'] = params[:end]
      req.params['term'] = params[:food]
      req.params['is_closed'] = false
      req.headers['Authorization'] = ENV['YELP_API_KEY']
    end
    parse_response(response)
  end

  def parse_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
