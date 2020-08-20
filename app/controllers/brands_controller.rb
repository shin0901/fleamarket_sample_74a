class BrandsController < ApplicationController

  def create
    Brand.create(brand_params)
  end

end

private

def brand_params
  params.require(:brand).permit(:name)
end
