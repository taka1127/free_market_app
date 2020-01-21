class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable 
        #  :omniauthable
  validates :email, :password, :nickname,
            :tel, :birthday, :name_kana,  :name,
            presence: true

  # validates :email, :password, :nickname,
  #           :birthday, :name_kana,  :name,
  #           presence: true
        
  has_many :goods
  has_many :products
  has_many :comments
  has_one :address
  accepts_nested_attributes_for :address, allow_destroy: true
end
