class Api::V1::ForecastController < ApplicationController

  def index
   forecast = ForecastFacade.new(params)
   render json: forecast.forecast_serializer
  end
end
