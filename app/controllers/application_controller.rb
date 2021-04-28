class ApplicationController < ActionController::API
  include ExceptionHandler

  before_action :authorized

  def my_secret
    Rails.application.secrets.secret_key_base
  end

  def issue_token(user)
    JWT.encode({ user_id: user.id }, my_secret, 'HS256')
  end

  def token
    request.headers['Authorization']
  end

  def decoded_token
    begin
      JWT.decode(token, my_secret, true, { :algorithm => 'HS256' })
    rescue JWT::DecodeError
      [{error: "Invalid Token"}]
    end
  end

  def user_id
    decoded_token.first['user_id']
  end

  def current_user
    @user ||= User.find_by(id: user_id)
  end

  def logged_in?
    !!current_user
  end

  def authorized
    render(json: { message: 'Please log in' }, status: :unauthorized) unless logged_in?
  end
end
