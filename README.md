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


### Association


## Goodテーブル
|Column|Type|Options|
|------|----|-------|

### Association

## Productテーブル
|Column|Type|Options|
|------|----|-------|

### Association
- has many :messages
- has_many :users, through: :groups_users
  has_many :groups_users

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

## Brand_Categoyテーブル
|Column|Type|Options|
|------|----|-------|

### Association