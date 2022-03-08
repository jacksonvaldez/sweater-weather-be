class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(user_params)
    user.api_key = SecureRandom.hex

    user.save!

    render json: UserSerializer.user_created(user, user.api_key), status: 201
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

end
