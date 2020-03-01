class CurrentForcastSummary

  attr_reader :current_temp,
              :summary,
              :summary_icon,
              :feels_like,
              :high_temp,
              :low_temp,
              :humidity,
              :visibility,
              :uv_index

  def initialize(data)
    require "pry"; binding.pry
    @current_temp = data[:currently][:temperature]
    @summary = data[:daily][:data][0][:summary]
    @summary_icon = data[:daily][:data][0][:icon]
    @feels_like = data[:currently][:apparentTemperature]
    @high_temp = data[:daily][:data][0][:temperatureHigh]
    @low_temp = data[:daily][:data][0][:temperatureLow]
    @humidity = data[:daily][:data][0][:humidity]
    @visibility = data[:daily][:data][0][:visibility]
    @uv_index = data[:daily][:data][0][:uvIndex]
  end
end
