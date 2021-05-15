class Api::V1::FavoritesController < ApplicationController
  before_action :set_favorite, only: %i[show destroy]

  def index
    @favorites = current_user.favorites
    render json: { favorites: @favorites }
  end

  def create
    @favorite = current_user.favorites.build(favorite_params)
    if @favorite.save
      render json: { favorite: @favorite }, status: :created
    else
      render json: { error: @favorite.errors.full_messages }, status: :not_acceptable
    end
  end

  def show
    if @favorite
      render json: { favorite: @favorite }
    else
      render json: { message: 'Couldn\'t find Favorite' }, status: :not_found
    end
  end

  def destroy
    @favorite.destroy
    head :no_content
  end

  private

  def favorite_params
    params.permit(:book_name, :chapter_num, :verse_num, :verse, :user_id)
  end

  def set_favorite
    @favorite = Favorite.find_by(id: params[:id])
  end
end
