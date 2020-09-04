class TopController < ApplicationController
  def index
    @search = Product.ransack(params[:q])
    @products = Product.all
    @images = Image.all
    
  end

  def search
  end

  def new
  end

  def show
  end

end
