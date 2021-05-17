module ControllerSpecHelper
  # TEST_SECRET = Rails.application.secrets.secret_key_base

  def token_generator(user_id)
    JWT.encode({ user_id: user_id }, 'my_secret')
  end

  def valid_headers
    {
      'Authorization' => token_generator(user.id),
      'Content-Type' => 'application/json'
    }
  end

  def invalid_headers
    {
      Authorization: nil,
      'Content-Type' => 'application/json'
    }
  end
end
