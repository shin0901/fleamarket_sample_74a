class ProductsController < ApplicationController
  def index
  end

  def new
    @product = Product.new
  end

  def show
    @search = Product.ransack(params[:q])
  end

  def create
    Product.create(product_params)
  end

  private

  def product_params
    params.require(:product).permit(:productName, :description, :price)
  end
  


end
