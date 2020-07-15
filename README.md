# README

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|

### Association
- has_many :items
- has_one :creditcard, dependent: :destroy
- has_one :user_address, dependent: :destroy
- has_one :profile, dependent: :destroy

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
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user

## creditcardsテーブル
|Column|Type|Options|
|------|----|-------|
|number|integer|null: false, unique: true|
|valid_thru_month|integer|null: false|
|valid_thru_year|integer|null: false|
|securitycode|integer|null: false|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user

## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|familyname|string|null: false|
|firstname|string|null: false|
|familyname_kana|string|null: false|
|firstname_kana|string|null: false|
|year_of_birth|integer|null: false|
|month_of_birth|integer|null: false|
|date_of_birth|integer|null: false|
|introduction|text||
|icon|string||
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, add_index: true|
|description|text|null: false|
|price|integer|null: false|
|user_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|size_id|references|foreign_key: true|
|brand_id|references|foreign_key: true|
|condition_id|references|null: false, foreign_key: true|
|shipping_charge_id|references|null: false, foreign_key: true|
|shipping_origin_id|references|null: false, foreign_key: true|
|days_until_shipping_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :brand
- belongs_to_active_hash :category
- belongs_to_active_hash :size
- belongs_to_active_hash :condition
- belongs_to_active_hash :shipping_charge
- belongs_to_active_hash :shipping_origin
- belongs_to_active_hash :days_until_shipping
- has_many :images, dependent: :destroy

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, add_index: true|
|ancestry|string|null: false|

### Association
- has_many :items

## sizeテーブル
|Column|Type|Options|
|------|----|-------|
|size|string|null: false|

### Association
- has_many :items

## brandsテーブル
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
|prefecture|string|null: false|

### Association
- has_many :items


## days_until_shippingテーブル
|Column|Type|Options|
|------|----|-------|
|days_until_shipping|integer|null: false|

### Association
- has_many :items

## shipping_chargeテーブル
|Column|Type|Options|
|------|----|-------|
|shipping_charge|string|null: false|

### Association
- has_many :items
