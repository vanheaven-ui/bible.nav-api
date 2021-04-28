class ApplicationController < ActionController::API
  include ExceptionHandler

  before_action :authorized

  def jwt_key
    Rails.application.secrets.secret_key_base
  end

  def issue_token(user)
    JWT.encode({ user_id: user.id }, jwt_key, 'HS256')
  end

  def token
    request.headers['Authorization']
  end

  def decoded_token
    begin
      JWT.decode(token, jwt_key, true, { algorthm: 'HS256' })
    rescue JWT::DecodeError => e
      raise ExceptionHandler::InvalidToken, e.message
    end
  end

  def user_id
    decoded_token.first['user_id']
  end

  def current_user
    user ||= User.find_by!(id: user_id)
  end

  def logged_in?
    !!current_user
  end

  def authorized
    render(json: { error: 'Please login ' }, status: :unauthorized) unless logged_in?
  end
end
