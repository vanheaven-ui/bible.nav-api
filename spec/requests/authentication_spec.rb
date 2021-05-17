require 'rails_helper'

RSpec.describe 'Authentications API', type: :request do
  let(:user) { create(:user) }
  let(:headers) { valid_headers.except('Authorization') }
  let(:valid_credentials) do
    {
      username: user.username,
      password: user.password
    }.to_json
  end
  let(:invalid_credentials) do
    {
      username: Faker::Internet.username,
      password: Faker::Internet.password
    }.to_json
  end
  describe 'POST /api/v1/login' do
    context 'when request is valid' do
      before { post '/api/v1/login', params: valid_credentials, headers: headers }

      it 'returns an authentication token' do
        expect(json['jwt']).not_to be_nil
      end
    end

    context 'when request is invalid' do
      before { post '/api/v1/login', params: invalid_credentials, headers: headers }

      it 'return a failure message' do
        expect(json['message'].match(/Couldn't find User/))
      end

      it 'returns status code 401' do
        expect(response).to have_http_status(401)
      end
    end
  end
end
