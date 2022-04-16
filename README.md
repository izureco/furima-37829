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
| lastname_kanji     | string  | null: false               |
| firstname_kanji    | string  | null: false               |
| lastname_kana      | string  | null: false               |
| firstname_kana     | string  | null: false               |
| birth_date         | date    | null: false               |

### Association : users

- has_many : items
- has_many : purchase_histories

## Items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| title            | string     | null: false                    |
| description      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| delivery_fee_id  | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| delivery_date_id | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association : items

- belongs_to : user
- has_one : purchase_history
- belongs_to : category
- belongs_to : condition
- belongs_to : delivery_fee
- belongs_to : prefecture
- belongs_to : delivery_date

### Association : Category (ActiveHash)

- has_many : items

### Association : Condition (ActiveHash)

- has_many : items

### Association : Delivery_fee (ActiveHash)

- has_many : items

### Association : Prefecture (ActiveHash)

- has_many : items

### Association : Delivery_date (ActiveHash)

- has_many : items


## Purchase_histories テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association : purchase-histories

- belongs_to : user
- belongs_to : item
- has_one : purchase

## Purchases テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| postal_code         | string     | null: false                    |
| prefecture_id       | integer    | null: false                    |
| city                | string     | null: false                    |
| house_number        | string     | null: false                    |
| build_number        | string     |                                |
| phone_number        | string     | null: false                    |
| purchase_history_id | references | null: false, foreign_key: true |

### Association : purchases

- belongs_to : purchase_history