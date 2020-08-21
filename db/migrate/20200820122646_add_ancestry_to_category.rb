class AddAncestryToCategory < ActiveRecord::Migration[5.2]
  def change
    # add_column :categories, :ancestry, :integer
    # categoriesテーブルにancestryカラムが無い場合に使用
    add_index :categories, :ancestry
  end
end
