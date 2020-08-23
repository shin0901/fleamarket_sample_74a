class ProductsController < ApplicationController
  def index
  end

  def new
    @products = Image.new
  end

  def create
    Image.create(img_up)
  end

  def show
    @search = Product.ransack(params[:q])
  end

  private
  def img_up
    params.require(:images).permit(:image)
  end

end
