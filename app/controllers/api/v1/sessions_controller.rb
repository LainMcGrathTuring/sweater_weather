class Api::V1::SessionsController < ApplicationController

  def new
  end

  def create
   if (user = User.find_by(email: params[:email])) && user.authenticate(params[:password])
     render json: { :status=> 200, :body => user.api_key}
   else
     render json: { :code=> 400, :body => "Credentials are not valid" }
   end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
