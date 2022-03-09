class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by!(email: params['email'])

    if user.authenticate(params['password'])
      render json: UserSerializer.show(user)
    else
      render json: ErrorSerializer.return_errors(["Invalid Credentials"]), status: 404
    end

  end

end
