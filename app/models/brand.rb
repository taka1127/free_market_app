class Brand < ApplicationRecord
  has_many :products
  has_many :categorys, through :brand_categorys
  has_many :brand_categorys
end
