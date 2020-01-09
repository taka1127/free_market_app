class Category < ApplicationRecord
  has_many :products
  has_many :brands, through :brand_categorys
  has_many :brand_categorys
end
