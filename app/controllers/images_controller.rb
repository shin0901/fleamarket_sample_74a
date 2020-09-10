class ImagesController < ApplicationController

  def new
  end

  def create
    @image = Image.new(img_up)
  end

  def show
    @image = Image.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
    @product.images.build
  end

  private
  def img_up
    params.require(:image).permit(:image, :product_id)
  end

end
