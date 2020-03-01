class ForcastFetcher

  def connection
    Faraday.new("https://api.darksky.net/forecast")
  end

  def get_forcast(location)
    conn = connection
    response = conn.get("#{ENV['DARK_SKY_API']}/#{location.latitude},#{location.longitude}")
    response_parse(response)
  end

  def response_parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end