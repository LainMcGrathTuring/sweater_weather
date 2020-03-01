class CurrentForcastSummary
  attr_reader :summary,
              :icon,
              :current_temp,
              :feels_like,
              :humidity,
              :uv_index,
              :visibilty

  def initialize(data)
    @summary = data[:summary]
    @icon = data[:icon]
    @current_temp = data[:temperature]
    @feels_like = data[:apparentTemperature]
    @humidity = data[:humidity]
    @uv_index = data[:uvIndex]
    @visibilty = data[:visibilty]
  end
end
