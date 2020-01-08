# README

## Userテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|name_kana|string|null: false|
|mail_adress|string|null: false, unique: true|
|password|string|null: false|
|tel|integer|null: false|
|birthday|date|null: false|
|postal_code|integer|null: false|
|area_1|integer|null: false|
|area_2|integer|null: false|
|area_3|integer||
|area_4|integer||
|self-introduction|text|
|point|integer||
|proceeds|integer||
### Association
- has_many :Likes
  has_many :Products
  has_many :Comments


## Commentテーブル
|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
### Association
- belong_to :Product
  belong_to :User


## Goodテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
### Association
- belong_to :Product
  belong_to :User


## Productテーブル
|Column|Type|Options|
|------|----|-------|
<!-- |image_id|integer|null: false,| -->
|name|string|null: false|
|content|text|null: false|
|category_id|integer|null: false, foreign_key: true|
|size|string||
|brand_id|integer|null: false, foreign_key: true|
|status|integer|null: false|
|delivery_charge|integer|null: false|
|shipping_methood|integer||
|date_of_shipment|integer|null: false|
|price|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belong_to :Brand
  belong_to :Category
  belong_to :User
  has_many :Images
  has_many :Comments
  has_many :Goods


## Imageテーブル
|Column|Type|Options|
|------|----|-------|
|image_1|string||
|image_2|string||
|image_3|string||
|image_4|string||
|image_5|string||
|image_6|string||
|image_7|string||
|image_8|string||
|image_9|string||
|image_10|string||
### Association
- belong_to :Product


## Brandテーブル
|Column|Type|Options|
|------|----|-------|
|brand|string||
|brand-category_id|integer|null: false, foreign_key: true|
### Association
  - has_many :Products
    has_many :Categorys, through :brand_category


## Categoryテーブル
|Column|Type|Options|
|------|----|-------|
|category_L|string||
|category_M|string||
|category_S|string||
|brand-category_id|integer|null: false, foreign_key: true|
### Association
- has_many :Products
  has_many :Brands, through:Brand_Category
  

## Brand_Categoyテーブル
|Column|Type|Options|
|------|----|-------|
|brand_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
### Association
  belong_to :Brand
  belong_to :Category