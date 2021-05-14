class Api::V1::AuthenticationController < ApplicationController
  skip_before_action :authorized, only: :create

  def create
    user = User.find_by!(username: login_params[:username])
    if user.authenticate(login_params[:password])
      token = issue_token(user)
      render json: { user: { id: user.id, username: user.username, email:  user.email }, jwt: token }
    else
      render json: { error: 'Invalid password' }, status: :unprocessable_entity
    end
  end

  private

  def login_params
    params.permit(:username, :password)
  end
end
