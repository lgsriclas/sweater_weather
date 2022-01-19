class Api::V1::UsersController < ApplicationController
  def create
    user_params[:email] = user_params[:email].downcase
    user = User.new(user_params)

    if user.save
      render json: UserSerializer.new(user), status: 201
    elsif params[:email].present? == false
      render json: {errors: {details: "Please enter a valid email."}}, status: 400
    elsif params[:password].present? == false
      render json: {errors: {details: "Please enter a valid password."}}, status: 400
    elsif params[:password_confirmation].present? == false
      render json: {errors: {details: "Passwords must match."}}, status: 400
    elsif params[:password_confirmation] != params[:password]
      render json: {errors: {details: "Passwords must match."}}, status: 400
    elsif User.exists?(email: params[:email]) == true
      render json: {errors: {details: "Email already exists."}}, status: 400
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end