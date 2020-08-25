class Profile < ApplicationRecord

  validates :first_name, :family_name, :first_name_kana, :family_name_kana, presence: true

  belongs_to :user

end


