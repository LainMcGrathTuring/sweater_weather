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

  def get_future_forecast(location, time)
    response = conn.get("#{ENV['DARK_SKY_API']}/#{location.latitude},#{location.longitude},#{time}") do |req|
      req.params['exclude'] = "flags,minutely"
    end
    data = response_parse(response)
    ArrivalForecast.new(data[:currently])
  end
end
