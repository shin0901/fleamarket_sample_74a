class Category < ApplicationRecord
  has_many :products
  def change
    add_column :categories, :name, :text
  end
  has_ancestry
end

