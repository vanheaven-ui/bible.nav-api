class Api::V1::UsersController < ApplicationController

  def signup
    @user = User.create!(signup_params)
    @token = issue_token(@user)
    render json: { user: @user, jwt: @token }, status: :created
  end

  private

  def signup_params
    params.permit(:username, :email, :password, :password_confirmation)
  end
end
