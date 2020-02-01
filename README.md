# README

## Userテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|tel|string|null: false|
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
|postal_code|string|null: false|
|prefecture|integer|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building|string||
|building_tel|string||
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
t.string  :name,             null: false
t.text    :content,          null: false
t.string  :size
t.string :brand_name,         foreign_key: true
t.string :status,           null: false
t.string :s_charge,         null: false
t.string :s_method,         null: false
t.string  :s_prefecture,     null: false
t.string :s_date,           null: false
t.integer :price,            null: false
t.string  :category,

|name|string|null: false|
|content|text|null: false|
<!-- |category_id|integer|null: false, foreign_key: true| 一時削除(1/17 中島) -->
|size|string||
|brandname|string||
|status|strig|null: false|
|s_charge|string|null: false|
|s_method|string|null: false|
|s_prefecture|string|null: false|
|s_date|string|null: false|
|price|integer|null: false|
|category_L|string|null: false|
|category_M|string|null: false|
|category_S|string|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :category
  <!-- belongs_to :brand -->
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

<!-- ## Brandテーブル
|Column|Type|Options|
|------|----|-------|
|brand|string||
### Association
  - has_many :products --1/23 檜田>

<!-- 一時的にProductのカラム内へ（1/17 中島） -->
## Categoryテーブル
|Column|Type|Options|
|------|----|-------|
|category_L|string||
|category_M|string||
|category_S|string||
### Association
- has_many :products
  
