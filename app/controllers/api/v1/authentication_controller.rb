class Api::V1::AuthenticationController < ApplicationController
  skip_before_action :authorized, only: :login

  def login
    user = User.find_by!(username: login_params[:username])
    if user.authenticate(login_params[:password])
      token = issue_token(user)
      render json: { user: user, jwt: token }
    else
      render json: { error: 'Invalid password' }, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find_by(id: user_id)
    render json: { user: @user }
  end

  private

  def login_params
    params.permit(:username, :password)
  end
end
