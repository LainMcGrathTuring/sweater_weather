class HourlyForcast

  attr_reader :data,
              :summary,
              :icon,
              :temperature

  def initialize(data)
    @time = data[:time]
    @summary = data[:summary]
    @icon = data[:icon]
    @temperature = data[:temperature]
  end

  def self.hourly_forcast(hourly_forcast)
    #hourly_forcast returns the current hour's weather as well as the next 48 hours
    next_eight_hours = []
    8.times do |hour|
      next_eight_hours << HourlyForcast.new(hourly_forcast[:data][hour])
    end
    next_eight_hours
  end
end
