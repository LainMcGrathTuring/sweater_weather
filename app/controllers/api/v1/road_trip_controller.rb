class Api::V1::RoadTripController < ApplicationController

  def new
  end

  def create
    road_trip = RoadTripFacade.new(params['origin'], params['destination'])
    render json: RoadTripSerializer.new(road_trip)
  end

end
