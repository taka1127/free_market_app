class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable 
        #  :omniauthable
  validates :email, :password, 
            :tel, :birthday, :name_kana, :nickname, :name,
            presence: true
        
  has_many :goods
  has_many :products
  has_many :comments
  has_one :address
end
