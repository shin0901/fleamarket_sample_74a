# README

## userテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|familyname|string|null: false|
|firstname|string|null: false|
|familyname_kana|string|null: false|
|firstname_kana|string|null: false|
|date_of_birth|integer|null: false|
|profile|string||
|creditcard_id|integer|null: false, foreign_key: true|
|user_address_id|integer|null: false, foreign_key: true|

### Association
- has_many :items
- has_one :creditcard
- has_one :user_address

## user_addressテーブル
|Column|Type|Options|
|------|----|-------|
|familyname|string|null: false|
|firstname|string|null: false|
|familyname_kana|string|null: false|
|firstname_kana|string|null: false|
|postalcode|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|integer|null: false|
|buildingname|string||
|phone|integer||
|user_id|integer|null: false, foreign_key: true|

### Association
- has_one :user

## creditcardテーブル
|Column|Type|Options|
|------|----|-------|
|number|integer|null: false|
|valid_thru_month|integer|null: false|
|valid_thru_year|integer|null: false|
|securitycode|integer|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- has_one :user

## itemテーブル
|Column|Type|Options|
|------|----|-------|
|name|integer|null: false, add_index: true|
|description|text|null: false|
|price|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
|sub_sub_category_id|integer|null: false, foreign_key: true|
|brand_id|integer||
|condition_id|integer|null: false, foreign_key: true|
|shipping_fee_id|integer|null: false, foreign_key: true|
|shipping_origin_id|integer|null: false, foreign_key: true|
|days_until_shipping_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :sub_sub_category
- belongs_to :brand
- belongs_to :condition
- belongs_to :shipping_fee
- belongs_to :shipping_origin
- belongs_to :days_until_shipping
- has_many :images

## imageテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item

## categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, add_index: true|

### Association
- has_many :sub_categories

## sub_categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, add_index: true|
|category_id|integer|null: false, add_index: true, foreign_key: true|

### Association
- has_many :sub_sub_categories
- belongs_to :category


## sub_sub_categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, add_index: true|
|sub_category_id|integer|null: false, add_index: true, foreign_key: true|

### Association
- has_many :items
- belongs_to :sub_category

## brandテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, add_index: true|

### Association
- has_many :items

## conditionテーブル
|Column|Type|Options|
|------|----|-------|
|condition|string|null: false|

### Association
- has_many :items

## shipping_originテーブル
|Column|Type|Options|
|------|----|-------|
|shipping_origin|string|null: false|

### Association
- has_many :items


## days_until_shippingテーブル
|Column|Type|Options|
|------|----|-------|
|days_until_shipping|integer|null: false|

### Association
- has_many :items

## shipping_feeテーブル
|Column|Type|Options|
|------|----|-------|
|shipping_fee|string|null: false|

### Association
- has_many :items
