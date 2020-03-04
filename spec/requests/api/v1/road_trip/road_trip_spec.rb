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
    expect(trip_response[:distance]).to have_key(:travel_time)
    expect(trip_response[:distance]).to have_key(:travel_time_in_seconds)

    expect(trip_response[:arrival_forecast].count).to eq(3)
    expect(trip_response[:arrival_forecast]).to have_key(:summary)
    expect(trip_response[:arrival_forecast]).to have_key(:temperature)
    expect(trip_response[:arrival_forecast]).to have_key(:feels_like)
  end

  it 'fails gracefully if no routes are found', :vcr do
    params = {
      origin: "Denver, CO",
      destination: "Barcelona, Spain"
    }

    post "/api/v1/road_trip", params: params
    trip_response = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
    expect(trip_response[:distance]).to eq("no routes found")
    expect(trip_response[:arrival_forecast]).to eq("cannot fetch forecast without a route")
  end
end
