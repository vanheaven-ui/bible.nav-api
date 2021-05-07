require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  let(:user) { build(:user) }
  let(:headers) { valid_headers.except('Authorization') }
  let(:valid_attributes) do
    attributes_for(:user, password_confirmation: user.password)
  end
  let(:invalid_payload) {{
    username: 'van',
    password: 'nav12345',
    email: 'eg@email.domain'
  }}

  describe 'POST /api/v1/signup' do
    context 'when request is valid' do
      before { post '/api/v1/signup', params: valid_attributes.to_json, headers: headers }

      it 'creates user object' do
        expect(json['user']).not_to be_empty
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when request is invalid' do
      before { post '/api/v1/signup', params: invalid_payload.to_json, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns failure message' do
        expect(json['message']).to match(/Validation failed: Password confirmation can't be blank/
        )
      end
    end    
  end
end
