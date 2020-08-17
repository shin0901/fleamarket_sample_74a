class ProductsController < ApplicationController
  def index

  end

  def new
  end

  def show
  end

  def search
    @search = Product.ransack(params[:q])
    @products = @search.result
  end

end
