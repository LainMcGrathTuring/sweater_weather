class Trip
  attr_reader :travel_distance,
              :travel_time,
              :arrival_time,
              :id

  def initialize(data)
    @id = nil
    @travel_distance = data[:routes][0][:legs][0][:distance][:text]
    @travel_time = data[:routes][0][:legs][0][:duration][:text]
    travel_time_in_seconds = data[:routes][0][:legs][0][:duration][:value]
    travel_seconds = travel_time_in_seconds % 60
    travel_minutes = (travel_time_in_seconds / 60) % 60
    travel_hours = travel_time_in_seconds / ( 60 * 60)
    @arrival_time = Time.now.change(sec: travel_seconds, min: travel_minutes, hour: travel_hours).to_i
  end
end
