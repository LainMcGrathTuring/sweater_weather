class ArrivalForecast

  attr_reader :temperature,
              :summary,
              :feels_like

  def initialize(data)
    @summary = data[:summary]
    @temperature = data[:temperature]
    @feels_like = data[:apparentTemperature]
  end
end
