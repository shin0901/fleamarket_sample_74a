class Address < ApplicationRecord
  
  belongs_to :user, optional: true
  validates :family_name, :first_name, :family_name_kana, :first_name_kana, 
            :postalcode, :prefecture, :city, :address, :birthday_date, presence: true

end
