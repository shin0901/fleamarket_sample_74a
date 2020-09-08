class ProductsController < ApplicationController

  before_action :set_category, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_product, only: [:show, :purchase, :pay]

  def get_category_children
    @category_children = Category.find("#{params[:parent_id]}").children
  end
  
  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def index
  end

  def new
    @product = Product.new
    @product.images.build
  end
  
  def show
    @product = Product.find(params[:id])
    @category_id = @product.category_id
    @category_parent = Category.find(@category_id).parent.parent
    @category_child = Category.find(@category_id).parent
    @category_grandchild = Category.find(@category_id)
  end

  def edit
    @product = Product.find(params[:id])
    @product.images.build
  end
  
  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html{redirect_to root_path, notice:'商品出品が完了しました'}
      else
        @product.images.build
        format.html{render action: 'new'}
      end
    end
  end

  def purchase
  end

  def pay
    @product = Product.find(params[:id])
    Payjp.api_key = ENV['PAYJP_PUBLIC_KEY']
    Payjp::Charge.create(
      amount: @product.price,
      card: params['payjp-token'],
      currency: 'jpy'
    )
  end

  def  done
    @product_buyer= Product.find(params[:id])
    @product_buyer.update( buyer_id: current_user.id)
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :condition_id, :size_id, :category_id,
    :prefecture_id, :days_until_shipping_id, :shipping_charge_id, :brand_id, :images, images_attributes:[:image])
    .merge(user_id: current_user.id)
  end

  
  def set_category
    @category_parent_array = Category.where(ancestry: nil)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
