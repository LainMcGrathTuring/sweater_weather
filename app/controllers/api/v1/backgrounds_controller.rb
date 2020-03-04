class Api::V1::BackgroundsController < ApplicationController

  def index
    location = Location.where(city: params[:location].split(",").first, state: params[:location].split(",").second).first
    image = ImageFacade.new(location)
    render json: ImageSerializer.new(image)
  end
end
