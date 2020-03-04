class RoadTripSerializer
  include FastJsonapi::ObjectSerializer
    attributes :origin,
               :destination,
               :distance,
               :arrival_forecast

end
