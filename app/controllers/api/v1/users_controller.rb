class Api::V1::UsersController < ApplicationController

  def new

  end

  def create
    user = User.create(user_params)
    if user.save
      response.status = 201
      render json: UserSerializer.new(user)
    else
      response.status = 401
      render json: user.errors.full_messages.to_sentence
    end
  end

  private
    def user_params
      params.permit(:email, :password, :password_confirmation)
    end
end
