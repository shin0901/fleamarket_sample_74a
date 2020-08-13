class Product < ApplicationRecord
  validates :productName, presence: true, length: {in: 1..40}
  validates :description, presence: true, length: {in: 1..1000}
  validates :price, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  belongs_to_active_hash :days_until_shipping
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :size
  belongs_to_active_hash :prefecture

end
