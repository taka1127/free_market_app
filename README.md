# README

## Userテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|name_kana|string|null: false|
|mail_address|string|null: false, unique: true|
|password|string|null: false|
|tel|integer|null: false|
|birthday|date|null: false|
|self-introduction|text||
|point|integer|default: 0|
|proceeds|integer|default: 0|
### Association
- has_many :goods
  has_many :products
  has_many :comments
  has_one :address

## Addressテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|postal_code|integer|null: false|
|prefectures|integer|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building|string||
### Association
  belongs_to :user
  
## Commentテーブル
|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :product
  belongs_to :user


## Goodテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :product
  belongs_to :user


## Productテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|content|text|null: false|
|category_id|integer|null: false, foreign_key: true|
|size|string||
|brand_id|integer|foreign_key: true|
|status|integer|null: false|
|delivery_charge|integer|null: false|
|shipping_methood|integer|null: false|
|date_of_shipment|integer|null: false|
|price|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :brand
  belongs_to :category
  belongs_to :user
  has_many :images
  has_many :comments
  has_many :goods


## Imageテーブル
|Column|Type|Options|
|------|----|-------|
|image|string||
|product_id|integer|null: false|
### Association
- belongs_to :product


## Brandテーブル
|Column|Type|Options|
|------|----|-------|
|brand|string||
|brand_category_id|integer|null: false, foreign_key: true|
### Association
  - has_many :products
    has_many :categorys, through :brand_category
    has_many :brand_categorys

## Categoryテーブル
|Column|Type|Options|
|------|----|-------|
|category_L|string||
|category_M|string||
|category_S|string||
|brand-category_id|integer|null: false, foreign_key: true|
### Association
- has_many :products
  has_many :brands, through :brand_category
  has_many :brand_categorys
  

## Brand_Categoyテーブル
|Column|Type|Options|
|------|----|-------|
|brand_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
### Association
  belong_to :brand
  belong_to :category