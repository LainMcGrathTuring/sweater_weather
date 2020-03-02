require 'rails_helper'

RSpec.describe 'Image API', :vcr => { :re_record_interval => 7.days } do
  it 'sends an image of the location searched for' do
    location = Location.create(id: 143, city: "Denver", state: "Colorado", country: "United States", latitude: 39.7392358, longitude: -104.87)

    get "/api/v1/backgrounds?location=Denver,Colorado"

    expect(response).to be_successful
  end
end
