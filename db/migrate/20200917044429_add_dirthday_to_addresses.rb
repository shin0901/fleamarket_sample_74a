class AddDirthdayToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :birthday_date, :date
  end
end
