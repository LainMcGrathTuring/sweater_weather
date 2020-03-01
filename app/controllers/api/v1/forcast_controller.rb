class Api::V1::ForcastController < ApplicationController

  def index
   forcast = ForcastFacade.new(params)
   require "pry"; binding.pry
   render json: forcast
  end
end
