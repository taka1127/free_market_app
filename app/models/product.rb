class Product < ApplicationRecord
  # belongs_to :brand
  # belongs_to :category
  belongs_to :user
  has_many :images
  # has_many :comments
  # has_many :goods
  accepts_nested_attributes_for :images, allow_destroy: true
end
