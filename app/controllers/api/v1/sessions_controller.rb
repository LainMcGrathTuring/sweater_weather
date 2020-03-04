class Api::V1::SessionsController < ApplicationController

  def new
  end

  def create
   if (user = User.find_by(email: params[:email])) && user.authenticate(params[:password])
     response.status = 201
     render json: UserSerializer.new(user)
   else
     response.status = 401
     render json: "Credentials are not valid" 
   end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
