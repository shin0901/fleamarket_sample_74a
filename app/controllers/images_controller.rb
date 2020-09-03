class ImagesController < ApplicationController

  def index
  end

  def new
  end

  def create
    @image = Image.new(img_up)
  end

  private
  def img_up
    params.require(:image).permit(:image, :product_id)
  end

end
