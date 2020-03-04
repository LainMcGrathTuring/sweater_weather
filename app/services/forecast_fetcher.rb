class ForecastFetcher

  def conn
    Faraday.new("https://api.darksky.net/forecast")
  end

  def get_forecast(location)
    response = conn.get("#{ENV['DARK_SKY_API']}/#{location.latitude},#{location.longitude}")
    response_parse(response)
  end

  def response_parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
