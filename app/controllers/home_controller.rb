class HomeController < ApplicationController
  skip_before_action :authorized, only: :index
  
  def index
    render json: { message: 'Welcome to bible.nav api' }
  end
end
