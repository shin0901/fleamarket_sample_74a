class BrandsController < ApplicationController

  def new
    @brand = Brand.new
    @brand.products.build
  end

  def create
    @brand = Brand.new(brand_params)
  end

end

private

def brand_params
  params.require(:brand).permit(:name)
end
