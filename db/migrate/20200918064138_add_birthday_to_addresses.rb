class AddBirthdayToAddresses < ActiveRecord::Migration[5.2]
  def change
    change_column_null :addresses, :birthday_date, false, DateTime.now
  end
end
