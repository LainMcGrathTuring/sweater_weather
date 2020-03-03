class ForecastFetcher

  def connection
    Faraday.new("https://api.darksky.net/forecast")
  end

  def get_forecast(location)
    conn = connection
    response = conn.get("#{ENV['DARK_SKY_API']}/#{location.first},#{location.second}")
    response_parse(response)
  end

  def response_parse(response)
    parse = JSON.parse(response.body, symbolize_names: true)
    [ parse[:currently][:summary], parse[:currently][:temperature] ]
  end
end
