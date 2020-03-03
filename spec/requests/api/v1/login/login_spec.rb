require 'rails_helper'

RSpec.describe 'Login' do
  it 'saves to the database and generate an api key', :vcr  do
    user = {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
    }
    post '/api/v1/users', params: user

    created_user = User.create("email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password")

    expect(response).to be_successful
    #response.body api returns different api key than created_user, test for this?
  end

  it "cannot save with bad credentails", :vcr do
    user = {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "passwo"
    }

    post '/api/v1/users', params: user
    expect(response).to be_successful

    expect(response.body).to eq("{\"code\":400,\"body\":\"Password confirmation doesn't match Password\"}")
  end

  it "if registered" do
    user = User.create(
        "email": "whatever@example.com",
        "password": "password",
        "password_confirmation": "password"
      )

    created_user = {"email": "whatever@example.com",
      "password": "password"}

      post '/api/v1/sessions', params: created_user
      expect(response).to be_successful
      # expect(response.body).to eq("{\"status\":200,\"body\":\"3SCEyhW5hWPuFCTMpgVvXYUn\"}")
  end
end
