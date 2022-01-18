class Api::V1::UsersController < ApplicationController

  def create
    user_params[:email] = user_params[:email].downcase
    user = User.new(user_params)

    if user.save
      render json: UserSerializer.new(user), status: 201
    else
      render json: {errors: {details: "There was an error completing this request."}}, status: 400
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end