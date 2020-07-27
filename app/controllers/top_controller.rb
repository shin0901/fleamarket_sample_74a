class TopController < ApplicationController
  def index
    @search = Product.ransack(params[:q])
  end

  def search
  end

end
