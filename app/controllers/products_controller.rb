class ProductsController < ApplicationController
  def index
    @search = Product.ransack(params[:q])
    @products = @search.result
  end

  def new
    @product = Product.new
  end

  def show
  end

  def create
    Product.create(product_params)
  end

  private

  def product_params
    params.require(:product).permit(:productName, :description, :price)
  end
  

  def search

  end

end
