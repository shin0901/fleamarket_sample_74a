class Size < ActiveHash::Base
  self.data = [
    { id: 1, name: "サイズなし商品" },
    { id: 2, name: "XS" },
    { id: 3, name: "S" },
    { id: 4, name: "M" },
    { id: 5, name: "L" },
    { id: 6, name: "XL" },
    { id: 7, name: "FREE SIZE" }
  ]
  include ActiveHash::Associations
  has_many :products
end
