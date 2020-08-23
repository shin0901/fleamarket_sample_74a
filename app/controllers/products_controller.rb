class ProductsController < ApplicationController
  def index
  end

  def new
    @product = Product.new

  end

  def show
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path, notice:'商品出品が完了しました'
    else
      render :new
    end
  end

  private
  # カテゴリ機能実装後に.merge(category_id: 1)の部分は修正
  def product_params
    params.require(:product).permit(:name, :description, :price, :condition_id, :size_id, 
    :prefecture_id, :days_until_shipping_id, :shipping_charge_id, :brand_id).merge(user_id: current_user.id).merge(category_id: 1)
  end

  def search

  end

end
