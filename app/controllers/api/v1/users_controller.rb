class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: :create

  def create
    @user = User.create!(signup_params)
    render json: { user: @user }, status: :created
  end

  def show
    render json: { user: User.find(params[:id]) }
  end

  private

  def signup_params
    params.permit(:username, :email, :password, :password_confirmation)
  end
end
