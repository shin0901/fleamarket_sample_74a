class ProductsController < ApplicationController

  before_action :set_category, only: [:new, :edit, :create, :update, :destroy]

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

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to root_path
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

  def show
    @product = Product.find(params[:id])
    @category_id = @product.category_id
    @category_parent = Category.find(@category_id).parent.parent
    @category_child = Category.find(@category_id).parent
    @category_grandchild = Category.find(@category_id)
  end

  def destroy
    product = Product.find(params[:id])
    respond_to do |format|
      if product.destroy
        format.html{redirect_to root_path, notice:'商品を削除しました'}
      else
        format.html{render action: 'edit', notice:'商品の削除に失敗しました'}
      end
    end
  end

  def edit
    @product = Product.find(params[:id])
    @category_id = @product.category_id
    @category_parent = Category.find(@category_id).parent.parent
    @category_child = Category.find(@category_id).parent
    @category_grandchild = Category.find(@category_id)
  end
  
  def update
    @product = Product.find(params[:id])
    @category_id = @product.category_id
    @category_parent = Category.find(@category_id).parent.parent
    @category_child = Category.find(@category_id).parent
    @category_grandchild = Category.find(@category_id)
    respond_to do |format|
      if @product.update(product_params)
        format.html{redirect_to root_path, notice:'商品情報を更新しました'}
      else
        format.html{render action: 'edit'}
      end
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :condition_id, :size_id, :category_id,
    :prefecture_id, :days_until_shipping_id, :shipping_charge_id, :brand_id, images_attributes:[:image, :id, :_destroy])
    .merge(user_id: current_user.id)
  end
  
  def set_category
    @category_parent_array = Category.where(ancestry: nil)
  end

end
