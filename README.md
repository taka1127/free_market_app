# README

## Userテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false,|
|name_kana|string|null: false,|
|mail_adress|string|null: false,|
|password|string|null: false,|
|tel|integer|null: false,|
|birthday|date|null: false,|
|postal_code|integer|null: false,|
|area_1|integer|null: false,|
|area_2|integer|null: false,|
|area_3|integer|
|area_4|integer|
|self-introduction|text|
|point|integer|
|proceeds|integer|
### Association
- has_many :like
  has_many :product
  has_many :comment


## Commentテーブル
|Column|Type|Options|
|------|----|-------|
|content|text|
|user_id|integer|
|product_id|integer|
### Association
- belong_to :product
  belong_to :user


## Goodテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|
|product_id|integer|
### Association
- belong_to :product
  belong_to :user


## Productテーブル
|Column|Type|Options|
|------|----|-------|
|image_id|integer|
|name|string|
|content|text|
|category_id|integer|
|size|string|
|brand_id|integer|
|status|integer|
|delivery_charge|integer|
|shipping_methood|integer|
|date_of_shipment|integer|
|price|integer|
|user_id|integer|
### Association
- has many :
  has_many :

## Imageテーブル
|Column|Type|Options|
|------|----|-------|

### Association

## Brandテーブル
|Column|Type|Options|
|------|----|-------|

### Association

## Categoryテーブル
|Column|Type|Options|
|------|----|-------|

### Association
- has_many :brand, through: :brand_category

## Brand_Categoyテーブル
|Column|Type|Options|
|------|----|-------|

### Association