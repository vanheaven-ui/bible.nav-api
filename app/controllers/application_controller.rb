class ApplicationController < ActionController::API
  include ExceptionHandler

  def jwt_key
    Rails.application.secrets.secret_key_base
  end

  def issue_token(user)
    JWT.encode({ user_id: user.id }, jwt_key, 'hs256')
  end
end
