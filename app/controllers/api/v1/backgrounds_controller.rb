class Api::V1::BackgroundsController < ApplicationController

  def index
    location = LocationFetcher.new.get_location(params[:location])
    image = ImageFacade.new(location)
    render json: ImageSerializer.new(image)
  end
end
