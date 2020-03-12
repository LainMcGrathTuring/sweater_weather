class Trip
  attr_reader :travel_time_in_seconds,
              :travel_time

  def initialize(data)
    @travel_time = data[:text]
    @travel_time_in_seconds = data[:value]
  end

  def estimated_arrival_time
    time = Time.now.to_i
    arrival = time + @travel_time_in_seconds
  end

end
