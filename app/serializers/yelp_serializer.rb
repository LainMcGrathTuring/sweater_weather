class YelpSerializer
  include FastJsonapi::ObjectSerializer

  def self.generate_json(trip_info)
    response = {
      data: {
        id: trip_info.trip_details.id,
        type: trip_info.type,
        attributes: {
          end_location: trip_info.destination.city,
          travel_time: trip_info.trip_details.travel_time,
          forecast: trip_info.arrival_forecast
          restaurant: {
            name: trip_info.restaurant.name
            address: trip_info.restaurant.address
          }
        }
      }
    }
  end
end
