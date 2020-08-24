class ImagsController < ApplicationController

  def new
  end

  def create
    Image.create(img_up)
  end

  private
  def img_up
    params.require(:images).permit(:image)
  end

end
