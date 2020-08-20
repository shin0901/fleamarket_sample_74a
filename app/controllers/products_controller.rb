class ProductsController < ApplicationController
  def index
  end

  def new
    @product = Product.new
    @product.build_brand
  end

  def show
  end

  def create
    @product = Product.new(product_params)
    
  end

  private

  def product_params
    params.require(:product).permit(:productName, :description, :price, :condition_id, :size_id, 
    :prefecture_id, :days_until_shipping_id, :shipping_charge_id, brand_attributes: [:id, :name])
  end
  

  def search

  end

end
