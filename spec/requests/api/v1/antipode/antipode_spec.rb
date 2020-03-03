require 'rails_helper'

RSpec.describe 'Antipode', :vcr do
  it 'can fidn antipode of Hong Kong' do
    get "/api/v1/antipode?location=Hong Kong"

    expect(response).to be_successful

    results = JSON.parse(response.body)
    require "pry"; binding.pry
    expect(results['data']['id']).to eq(nil)
    expect(results['data']['type']).to eq('antipode')
    expect(results['data']['attributes'].count).to eq(3)
    expect(results['data']['attributes']['forecast'].keys).to eq(["summary", "current_temperature"])
    expect(results['data']['attributes']['search_location']).to eq("Hong Kong")
  end
end
