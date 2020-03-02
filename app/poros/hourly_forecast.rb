class HourlyForecast

  attr_reader :time,
              :summary,
              :icon,
              :temperature

  def initialize(data)
    @time = data[:time]
    @summary = data[:summary]
    @icon = data[:icon]
    @temperature = data[:temperature]
  end

  def self.hourly_forecast(hourly_forecast)
    #hourly_forcast returns the current hour's weather as well as the next 48 hours
    next_eight_hours = []
    8.times do |hour|
      next_eight_hours << HourlyForecast.new(hourly_forecast[:data][hour])
    end
    next_eight_hours
  end
end
