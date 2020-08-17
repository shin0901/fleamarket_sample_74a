class Product < ApplicationRecord

  def self.search(search)
    if search
      Product.where('text LIKE(?)', "%#{search}%")
    else
      Product.all
    end
  end

end
