class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :family_name, null: false
      # ↑苗字
      t.string :first_name, null: false
      # ↑名前
      t.string :family_name_kana, null: false
      # ↑苗字かな
      t.string :first_name_kana, null: false
      # ↑名前かな
      t.integer :postalcode, null: false
      # ↑郵便番号
      t.string :prefecture_id, null: false
      # ↑都道府県
      t.string :city, null: false
      # ↑市町村
      t.integer :address, null: false
      # ↑番地
      t.string :buildingname
      # ↑マンション名、部屋番号
      t.string :phone
      # ↑電話番号
      t.references :user, foreign_key: true
    end
  end
end
