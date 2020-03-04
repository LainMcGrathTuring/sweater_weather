class CurrentForecastSummary
  attr_reader :summary,
              :icon,
              :current_temp,
              :feels_like,
              :humidity,
              :uv_index,
              :visibility

  def initialize(data)
    @summary = data[:summary]
    @icon = data[:icon]
    @current_temp = data[:temperature]
    @feels_like = data[:apparentTemperature]
    @humidity = data[:humidity]
    @uv_index = data[:uvIndex]
    @visibility = data[:visibility]
  end
end
