require 'rails_helper'

RSpec.describe 'Weather API' do
  it 'sends a list of forcast items', :vcr => { :re_record_interval => 7.days } do

    get "/api/v1/forcast?location=denver,co"

    expect(response).to be_successful

    forcast_response = JSON.parse(response.body, symbolize_names: true)

    expect(forcast_response.count).to eq(2)
    expect(forcast_response.first[0]).to eq(:location)
    expect(forcast_response[:weather].count).to eq(3)
  end
end
