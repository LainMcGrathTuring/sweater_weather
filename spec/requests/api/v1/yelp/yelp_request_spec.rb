require 'rails_helper'

RSpec.describe 'Yelp API', :vcr do
  it "can get the associated items" do
    get "/api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese"

    expect(response).to be_successful
  end
end
