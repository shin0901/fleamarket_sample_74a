class Category < ApplicationRecord
  def change
    add_column :categories, :name, :text
  end
  has_ancestry
  has_many :products
end

