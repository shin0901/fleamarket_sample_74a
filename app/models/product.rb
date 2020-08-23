class Product < ApplicationRecord

  enum status: { published: 0, draft: 1, sold_out: 2}
   
  validates :name, presence: true, length: {maximum:40}
  validates :description, presence: true, length: {maximum:1000}
  validates :price, presence: true

  has_many :images
  belongs_to :user
  belongs_to :category


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :size
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :days_until_shipping
  belongs_to_active_hash :brand

  validates :condition, presence: true
  validates :days_until_shipping, presence: true
  validates :shipping_charge, presence: true
  validates :prefecture, presence: true

end
