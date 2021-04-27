class HomeController < ApplicationController
  def index
    render json: { message: 'Welcome to bible.nav api' }
  end
end
