class Product < ApplicationRecord
  validates :productName, presence: true, length: { in 1..40 }
  validates :description, presence: true, length: { in 1..1000 }
  validates :price, presence: true
end
