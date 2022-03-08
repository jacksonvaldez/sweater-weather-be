class Api::V1::UsersController < ApplicationController

  def create
    api_key = SecureRandom.hex
    user = User.new(user_params)
    user.api_key_digest = Digest::SHA256.hexdigest api_key

    user.save!

    render json: UserSerializer.user_created(user, api_key), status: 201
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

end
