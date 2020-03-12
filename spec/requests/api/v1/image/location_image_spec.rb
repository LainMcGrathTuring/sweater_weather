require 'rails_helper'

RSpec.describe 'Image API' do
  it 'sends an image of the location searched for' do
    VCR.use_cassette('example', :record => :new_episodes) do

      location = ("Denver, CO")

      get "/api/v1/backgrounds?location=Denver,Colorado", params: location

      expect(response).to be_successful

      image_response = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]

      expect(image_response[:image_info][:urls].count).to eq(5)
      expect(image_response[:image_info].count).to eq(6)
      expect(image_response[:image_info]).to have_key(:alt_description)
      expect(image_response[:image_info][:city]).to eq("Denver")
      expect(image_response[:image_info][:country]).to eq("United States")
    end
  end

  it 'sends an image of a different city searched for', :vcr do
    VCR.use_cassette('example', :record => :new_episodes) do
      location = ("Fort Collins,CO")

      get "/api/v1/backgrounds?location=Fort Collins,Colorado", params: location

      expect(response).to be_successful

      image_response = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]

      expect(image_response[:image_info][:urls].count).to eq(5)
      expect(image_response[:image_info].count).to eq(6)
      expect(image_response[:image_info]).to have_key(:alt_description)
      expect(image_response[:image_info][:city]).to eq("Fort Collins")
      expect(image_response[:image_info][:country]).to eq("United States")
    end
  end
end
