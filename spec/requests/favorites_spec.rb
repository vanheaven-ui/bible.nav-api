require 'rails_helper'

RSpec.describe 'Favorites API', type: :request do
  let(:user) { create(:user) }
  let!(:favorites) { create_list(:favorite, 10, user_id: user.id) }
  let(:headers) { valid_headers }
  let(:invalid_header) { invalid_headers }
  let(:user_id) { user.id }
  let(:id) { favorites.first.id }

  describe 'GET /api/v1/users/user_id/favorites' do
    context 'when user is logged in' do
      before { get "/api/v1/users/#{user_id}/favorites", headers: headers }

      it 'returns user\'s favorites' do
        expect(json['favorites'].size).to eq(10)
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
        expect(json['message']).to match(/Invalid token, please login/)
      end
    end
  end

  describe 'GET /api/v1/users/user_id/favorites/id' do
    before { get "/api/v1/users/#{user_id}/favorites/#{id}", headers: headers }

    context 'when favorite exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the favorite' do
        expect(json['favorite']).not_to be_empty
      end
    end

    context 'when the favorite does not exist' do
      let(:id) { 100 }
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns failure message' do
        expect(json['message']).to match(/Couldn't find Favorite/)
      end
    end
  end

  describe 'POST /api/v1/users/user_id/favorites' do
    let(:valid_params) { favorites.first }
    let(:invalid_params) do
      attributes_for(:favorite, verse: '')
    end
    context 'with valid parameters' do
      before { post "/api/v1/users/#{user_id}/favorites", params: valid_params.to_json, headers: headers }

      it 'creates the favorite' do
        expect(json['favorite']).not_to be_empty
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'with invalid parameters' do
      before { post "/api/v1/users/#{user_id}/favorites", params: invalid_params.to_json, headers: headers }
      it 'returns status code 406' do
        expect(response).to have_http_status(406)
      end

      it 'returns failure message' do
        expect(json['error'][0]).to match(/Verse can't be blank/)
      end
    end
  end

  describe 'DELETE /api/v1/users/user_id/favorites/id' do
    before { delete "/api/v1/users/#{user_id}/favorites/#{id}", headers: headers }

    context 'when favorite exists' do
      it 'returns status 204' do
        expect(response).to have_http_status(204)
      end

      it 'removes favorite' do
        expect(favorites[id]).to be_nil
      end
    end
  end
end
