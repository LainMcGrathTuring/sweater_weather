class DailyForecast

attr_reader :time,
            :summary,
            :icon,
            :participation,
            :high_temp,
            :low_temp

  def initialize(data)
    @time = data[:time]
    @summary = data[:summary]
    @icon = data[:icon]
    @participation = data[:precipProbability]
    @high_temp = data[:temperatureHigh]
    @low_temp = data[:temperatureLow]
  end

  def self.next_five_days(daily_forecast)
    #this hash the current date and the next 7 days
    five_day_forecast = []
    6.times do |day|
      five_day_forecast << DailyForecast.new(daily_forecast[:data][day])
    end
    five_day_forecast
  end
end
