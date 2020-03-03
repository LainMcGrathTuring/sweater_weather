class Api::V1::UsersController < ApplicationController

  def new

  end

  def create
    user = User.create(user_params)
    if user.save
      body = { api_key: user.api_key }
      render json: { :status=>200, :body => body }
    else
      render json: { :code => 400, :body => user.errors.full_messages.to_sentence }
    end
  end

  private
    def user_params
      params.permit(:email, :password, :password_confirmation)
    end
end
