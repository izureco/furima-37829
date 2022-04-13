# README

This README would normally document whatever steps are necessary to get the
application up and running.

# テーブル設計
## 必要機能

(1)ユーザー管理機能
(2)商品出品機能
(3)商品購入機能

## Users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------  | -----------               |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| lastname_Kanji     | string  | null: false               |
| firstname_Kanji    | string  | null: false               |
| lastname_Kana      | string  | null: false               |
| firstname_Kana     | string  | null: false               |
| birth_year_id      | integer | null: false               |
| birth_month_id     | integer | null: false               |
| birth_day_id       | integer | null: false               |

### Association : users

- has_many : items
- has_many : purchases
- has_one : birth_year
- has_one : birth_month
- has_one : birth_day

### Association : Birth_year (ActiveHash)

- belongs_to : user

### Association : Birth_month (ActiveHash)

- belongs_to : user

### Association : Birth_day (ActiveHash)

- belongs_to : user


## Items テーブル

| Column           | Type    | Options                        |
| ---------------- | ------  | ------------------------------ |
| title            | string  | null: false                    |
| description      | text    | null: false                    |
| category_id      | integer | null: false                    |
| condition_id     | integer | null: false                    |
| delivery_fee_id  | integer | null: false                    |
| delivery_area_id | integer | null: false                    |
| delivery_date_id | integer | null: false                    |
| price            | integer | null: false                    |
| user             | integer | null: false, foreign_key: true |

### Association : items

- belongs_to : user
- has_one : purchase
- has_one : category
- has_one : condition
- has_one : delivery_fee
- has_one : delivery_area
- has_one : delivery_date

### Association : Category (ActiveHash)

- belongs_to : item

### Association : Condition (ActiveHash)

- belongs_to : item

### Association : Delivery_fee (ActiveHash)

- belongs_to : item

### Association : Delivery_area (ActiveHash)

- belongs_to : item

### Association : Delivery_date (ActiveHash)

- belongs_to : item


## Purchases テーブル

| Column          | Type    | Options                        |
| --------------- | ------  | ------------------------------ |
| postal_code     | string  | null: false                    |
| prefecture_id   | integer | null: false                    |
| city            | string  | null: false                    |
| house_number    | string  | null: false                    |
| build_number    | string  | null: false                    |
| phone_number    | string  | null: false                    |
| user            | string  | null: false, foreign_key: true |
| item            | string  | null: false, foreign_key: true |

### Association : purchases

- belongs_to : user
- belongs_to : item
- has_one : prefecture

### Association : Prefecture (ActiveHash)

- belongs_to : purchase
