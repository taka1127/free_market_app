class Product < ApplicationRecord
  # validates :name, :content, :category_id,
  #           :brand_id, :status, :delivery_charge, :shipping_method,
  #           :date_of_shipment, :price, :user,
  #           presence: true

  belongs_to :brand
  belongs_to :category
  belongs_to :user
  has_many :images
  has_many :comments
  has_many :goods
end
