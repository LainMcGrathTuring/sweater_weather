class Location < ApplicationRecord

  def self.save_location(params)
    location = Location.create_or_find_by(
    city: params[:results][0][:address_components][0][:long_name]) do |l|
      l.state = params[:results][0][:address_components][2][:long_name]
      l.country = params[:results][0][:address_components][3][:long_name]
      l.latitude = params[:results][0][:geometry][:location][:lat]
      l.longitude = params[:results][0][:geometry][:location][:lng]
    end
    location
  end
end
