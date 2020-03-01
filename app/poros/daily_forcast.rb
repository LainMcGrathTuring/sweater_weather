class DailyForcast

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

  def self.next_five_days(daily_forcast)
    #this hash the current date and the next 7 days
    #choosing to return today and next 5 days for greater flexibilty on front-end
    five_day_forcast = []
    6.times do |day|
      five_day_forcast << DailyForcast.new(daily_forcast[:data][day])
    end
    five_day_forcast
  end
end
