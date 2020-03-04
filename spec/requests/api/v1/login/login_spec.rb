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

    user_response = JSON.parse(response.body)

    expect(response).to be_successful
    expect(user_response['data']['attributes']).to have_key('api_key')
  end

  it "cannot save with bad credentails", :vcr do
    user = {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "passwo"
    }

    post '/api/v1/users', params: user

    expect(response).to_not be_successful

    expect(response.body).to eq("Password confirmation doesn't match Password")
  end

  it "if registered", :vcr  do
    user = User.create(
        "email": "whatever@example.com",
        "password": "password",
        "password_confirmation": "password"
      )

    created_user = {"email": "whatever@example.com",
      "password": "password"}

    post '/api/v1/sessions', params: created_user

    expect(response).to be_successful

    user_response = JSON.parse(response.body)
    expect(user_response['data']['attributes']).to have_key('api_key')
  end

  it "if registered and enters bad credentials", :vcr  do
    user = User.create(
        "email": "whatever@example.com",
        "password": "password",
        "password_confirmation": "password"
      )

    created_user = {"email": "whatever@example.com",
      "password": "passwo"}

    post '/api/v1/sessions', params: created_user

    expect(response).to_not be_successful

    expect(response.body).to eq("Credentials are not valid")
  end
end
