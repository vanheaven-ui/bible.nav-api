class Api::V1::FavoritesController < ApplicationController

  before_action :set_favorite, only: %i[show destroy]

  def index
    @favorites = current_user.favorites
    render json: { favorites: @favorites }
  end
  
  def create
    @favorite = current_user.favorites.create!(favorite_params)
    render json: { favorite: @favorite }, status: :created
  end

  def show
    render json: { favorite: @favorite }
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
    @favorite = current_user.favorites.find_by(id: favorite_params[:id])
  end
end
