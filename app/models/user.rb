class User < ApplicationRecord
  has_many :goods
  has_many :products
  has_many :comments
  has_one :address
end
