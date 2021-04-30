class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: :signup

  def signup
    @user = User.create!(signup_params)
    @token = issue_token(@user)
    render json: { user: @user, jwt: @token }, status: :created
  end

  def show
    render json: { user: current_user }
  end

  private

  def signup_params
    params.permit(:username, :email, :password, :password_confirmation)
  end
end
