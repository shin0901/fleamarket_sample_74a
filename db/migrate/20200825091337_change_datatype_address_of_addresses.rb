class ChangeDatatypeAddressOfAddresses < ActiveRecord::Migration[5.2]
  def change
    change_column :addresses, :address, :string
  end
end
