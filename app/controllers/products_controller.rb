class ProductsController < ApplicationController
  def index
    @search = Product.ransack(params[:q])
    @products = @search.result
  end

  def new
  end

  def show
  end

  def search

  end

end
