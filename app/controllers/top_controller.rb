class TopController < ApplicationController
  def index
    @search = Product.ransack(params[:q])
  end

  def search
  end

  def new
  end

  def show
  end

end
