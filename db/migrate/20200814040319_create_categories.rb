class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      # 商品出品機能実装ではancestryカラムはからの状態なのでnull:falseはカテゴリ機能実装の際に追加
      t.string :ancestry

      t.timestamps
    end
  end
end
