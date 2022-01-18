class Api::V1::SessionsController < ApplicationController
  def create
    # create_user = JSON.parse(request.raw_post, symbolize_names: true)
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      render json: UserSerializer.new(user), status: 201
    else
      render json: {errors: {details: "There was an error completing this request."}}, status: 400
    end
  end
end