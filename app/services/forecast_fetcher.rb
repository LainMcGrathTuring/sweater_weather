class ForecastFetcher

  def conn
    Faraday.new("https://api.darksky.net/forecast")
  end

  def get_forecast(params)
    response = conn.get("#{ENV['DARK_SKY_API']}/#{params}") do |req|
      req.params['exclude'] = "flags,minutely"
    end
    response_parse(response)
  end

  def response_parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_future_forecast(params)
    data = get_forecast(params)
    ArrivalForecast.new(data[:currently])
  end
end
