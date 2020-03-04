class ArrivalForecast

  attr_reader :temperature,
              :summary

  def initialize(data)
    @temperature = data[:temperature]
    @summary = data[:summary]
  end
end
