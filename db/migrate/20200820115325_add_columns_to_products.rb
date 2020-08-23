class AddColumnsToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :description, :text
    add_column :products, :price, :integer
    add_column :products, :prefecture_id, :integer
    add_column :products, :size_id, :integer
    add_column :products, :condition_id, :integer
    add_column :products, :shipping_charge_id, :integer
    add_column :products, :days_until_shipping_id, :integer
    add_column :products, :brand_id, :integer
    add_reference :products, :user, null: false, foreign_key: true
    add_reference :products, :category, null: false, foreign_key: true

  end
end
