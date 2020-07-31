class ProductsController < ApplicationController
  def index
  end

  def new
  end

  def show
    @search = Product.ransack(params[:q])
  end
end
