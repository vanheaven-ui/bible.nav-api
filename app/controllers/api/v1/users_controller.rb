class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: :create

  def create
    @user = User.new(signup_params)
    if @user.save
      render json: { user: @user }, status: :created
    else
      render json: { error: @user.errors.full_messages }, status: :not_acceptable
    end
  end

  def show
    render json: { user: User.find(params[:id]) }
  end

  private

  def signup_params
    params.permit(:username, :email, :password, :password_confirmation)
  end
end
