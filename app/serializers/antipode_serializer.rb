class AntipodeSerializer
  include FastJsonapi::ObjectSerializer
    attributes :search_location,
               :starting_location_coordinates,
               :location_name,
               :forcast

end
