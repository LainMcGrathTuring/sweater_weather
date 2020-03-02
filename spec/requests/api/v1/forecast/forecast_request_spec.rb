require 'rails_helper'

RSpec.describe 'Weather API' do
  it 'sends a list of forecast items', :vcr => { :re_record_interval => 7.days } do

    get "/api/v1/forecast?location=denver,co"

    expect(response).to be_successful

    forecast_response = JSON.parse(response.body, symbolize_names: true)

    expect(forecast_response.count).to eq(3)
    expect(forecast_response.first[0]).to eq(:location)
    expect(forecast_response[:weather].count).to eq(3)
  end
end
