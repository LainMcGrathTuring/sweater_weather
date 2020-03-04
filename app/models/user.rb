class User < ApplicationRecord
  before_create :set_api_key

  validates_presence_of :email
  validates_presence_of :password, require: true, :on => :create
  validates_presence_of :password_confirmation, require: true, :on => :create

  has_secure_password


  def generate_api_key
    SecureRandom.base58(24)
  end

  def set_api_key
    self.api_key = generate_api_key
  end

end
