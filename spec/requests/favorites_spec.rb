require 'rails_helper'

RSpec.describe "Favorites API", type: :request do
  let(:user) { create(:user) }
  let(:favorites) { create_list(:favorite, 10, user_id: user.id) }
  let(:headers) { valid_headers }
  let(:invalid_header) { invalid_headers }
  let(:user_id) { user.id }
  let(:id) { favorites.first.id }

  describe "GET /api/v1/users/user_id/favorites" do
    context 'when user is logged in' do
      before { get "/api/v1/users/#{user_id}/favorites", headers: headers }
      it 'returns user\'s favorites' do
        expect(json.length).to eq(10)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when user is not logged in' do
      before { get "/api/v1/users/#{user_id}/favorites", headers: invalid_header }
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns failure message' do
        expect(json['message']).to match(/Invalid token/)
      end
    end
  end

  describe 'GET /api/v1/users/user_id/favorites/id' do
    before { get "api/v1/users/#{user_id}/favorites/#{id}", headers: headers }
  end

  describe 'POST /api/v1/users/user_id/favorites' do
    before { get "api/v1/users/#{user_id}/favorites", headers: headers }
  end

  describe 'DELETE /api/v1/users/user_id/favorites/id' do
    before { delete "api/v1/users/#{user_id}/favorites/#{id}", headers: headers }
  end

end
