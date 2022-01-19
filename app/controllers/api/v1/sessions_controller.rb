class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      render json: UserSerializer.new(user), status: 201
    else
      render json: {errors: {details: "There was an error processing your request. Your credentials are invalid."}}, status: 400
    end
  end
end