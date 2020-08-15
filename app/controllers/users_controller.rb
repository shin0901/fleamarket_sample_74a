class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show
  
  def index
  end

  def show
    @search = Product.ransack(params[:q])
  end
end
