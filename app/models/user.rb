class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable
         :recoverable, :rememberable, :validatable, :password_length

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, uniqueness: true, length: { minimum: 7 }
end
