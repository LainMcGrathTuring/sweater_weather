class ForcastSummary

  attr_reader :response

  def initialize(location)
    @response = ForcastFetcher.new.get_forcast(location)
  end

  def current_weather
    CurrentForcastSummary.new(response[:currently])
  end

  def daily_forcast
    DailyForcast.next_five_days(response[:daily])
  end

end
