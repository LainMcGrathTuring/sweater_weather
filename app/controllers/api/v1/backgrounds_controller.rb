class Api::V1::BackgroundsController < ApplicationController

  def index
    location = Location.where(city: params[:location].split(",").first, state: params[:location].split(",").second).first
    image = ImageFetcher.new.get_image(location)
  end
end
