class Size < ActiveHash::Base
  self.data = [
    { id: 1, name: "XS" },
    { id: 2, name: "S" },
    { id: 3, name: "M" },
    { id: 4, name: "L" },
    { id: 5, name: "XL" }
  ]
  include ActiveHash::Associations
  has_many :products
end
