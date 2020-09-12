class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 7, maximum: 128 }


  has_many :products
  has_one :address
  has_one :profile, :dependent => :destroy
  has_one :credit_card, dependent: :destroy

end
