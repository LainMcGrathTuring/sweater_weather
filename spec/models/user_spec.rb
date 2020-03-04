require 'rails_helper'

RSpec.describe User, type: :model do
  it {should validate_presence_of(:email)}
  it {should validate_uniqueness_of(:email)}
  it {should validate_presence_of(:password)}
  it {should validate_presence_of(:password_confirmation)}

  it "can generate an api_key" do
    user = User.create!(
      email: "whatever@example.com",
      password: "password",
      password_confirmation: "password")

      expect(user.api_key).to match(/[A-Za-z0-9]{24}/)
  end
end
