class Api::V1::AuthenticationController < ApplicationController

  def login
    user = User.find_by!(username: login_params[:username])
    if user.authenticate(login_params[:password])
      token = issue_token(user)
      render json: { user: user, jwt: token }
    else
      render json: { error: 'Invalid password' }, status: :unauthorized
    end
  end

  private
  
  def login_params
    params.permit(:username, :password)
  end
end
