require 'rails_helper'

RSpec.describe 'Weather API' do
  it 'sends a list of forecast items', :vcr => { :re_record_interval => 7.days } do

    get "/api/v1/forecast?location=denver,co"

    expect(response).to be_successful

    forecast_response = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]

    expect(forecast_response.count).to eq(4)
    expect(forecast_response[:location_results][:city]).to eq("Denver")
    expect(forecast_response[:daily_weather_forecast].count).to eq(6)
    expect(forecast_response[:hourly_weather_forecast].count).to eq(8)
    expect(forecast_response[:current_weather].count).to eq(7)
  end
end
