class Brand < ApplicationRecord
  has_many :products
  has_many :categorys, through :brand_category
  has_many :brand_categorys
end
