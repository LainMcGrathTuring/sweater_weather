require 'rails_helper'

RSpec.describe 'Image API' do
  it 'sends an image of the location searched for' do
    VCR.turn_off! :ignore_cassettes => true
    WebMock.allow_net_connect!
    
    location = Location.create(id: 143, city: "Denver", state: "Colorado", country: "United States", latitude: 39.7392358, longitude: -104.87)

    get "/api/v1/backgrounds?location=Denver,Colorado"

    expect(response).to be_successful
  end
end
