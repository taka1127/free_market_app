class Product < ApplicationRecord
  scope :index, -> (count) { includes(:images).where(count).order("created_at DESC").limit(10) }
  validates :name, :content, :status, :s_charge, :s_method, :s_prefecture, 
            :s_date, :price, :category,
            presence: true
  # belongs_to :brand, optional: true
  # belongs_to :category
  belongs_to :user
  has_many :images, dependent: :delete_all
  has_many :comments
  has_many :goods
  accepts_nested_attributes_for :images, allow_destroy: true
  attr_accessor :keyword


  def self.search(search)
    return Product.all unless search
    Product.where('name LIKE(?)', "%#{search}%")
  end
end