require 'rails_helper'

RSpec.describe 'Road Trip' do
  it 'can find trip details', :vcr do
    params = {
      origin: "Denver, CO",
      destination: "Pueblo, CO"
    }

    post "/api/v1/road_trip", params: params

    trip_response = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]

    expect(trip_response[:origin][:city]).to eq("Denver")
    expect(trip_response[:destination][:city]).to eq("Pueblo")
    expect(trip_response.count).to eq(4)
    expect(trip_response[:distance].count).to eq(2)
  end
end
