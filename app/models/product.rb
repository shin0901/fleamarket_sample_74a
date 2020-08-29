class Product < ApplicationRecord

  enum status: { published: 0, sold_out: 1}
   
  validates :name, presence: true, length: {maximum:40}
  validates :description, presence: true, length: {maximum:1000}
  validates_associated :images
  validates :price, presence: true
  validates :images, presence: true

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

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
