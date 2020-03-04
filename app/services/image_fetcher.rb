class ImageFetcher

  def connection
    Faraday.new("https://api.unsplash.com")
  end

  def get_image(location)
    conn = connection
    response = conn.get("search/photos") do |req|
      req.params['client_id'] = ENV['UPSPLASH_ACCESS_KEY']
      req.params['query'] = "#{location} skyline"
    end
    parse_response(response)
  end

  def parse_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
