class Api::V1::MunchiesController < ApplicationController

  def index
    facade = YelpFacade.new(params)
    render json: facade.yelp_serializer
  end
end
