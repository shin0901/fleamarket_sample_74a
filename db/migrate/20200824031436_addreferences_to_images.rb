class AddreferencesToImages < ActiveRecord::Migration[5.2]
  def change
    add_reference :images, :product, null: false, foreign_key: true
  end
end
