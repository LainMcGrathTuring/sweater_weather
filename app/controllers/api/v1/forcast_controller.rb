class Api::V1::ForcastController < ApplicationController

  def index
   forcast = ForcastFacade.new(params)

   render json: forcast.forcast_serializer
  end
end
