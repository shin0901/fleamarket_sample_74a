class AddStatusToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :status, :integer, null: false, default: 0
    add_column :products, :buyer_id, :integer
  end
end
