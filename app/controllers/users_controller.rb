class UsersController < ApplicationController
  
  def index
  end

  def show
    @search = Product.ransack(params[:q])
  end

  protected

  
end
