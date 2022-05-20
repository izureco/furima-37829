# アプリケーション名
ユーザーが思い思いの商品を売買できるフリーマーケットアプリケーション FURIMA

# アプリケーション概要
Tech Campの最終課題として、アプリケーションを作成

# 実装機能
- ユーザー管理機能
- 商品出品機能
- 商品購入機能

# DEMO
URL : https://furima-37829.herokuapp.com/
GitHub : https://github.com/izureco/furima-37829

# 動作確認方法
- WebブラウザGoogle Chromeの最新版を利用してアクセスしてください。
- ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続してください。
- 接続先およびログイン情報については、下記の通りです。
- 同時に複数の方がログインしている場合に、ログインできない可能性があります。
- テストアカウントでログイン→トップページから出品ボタン押下→商品情報入力→商品出品
- 確認後、ログアウト処理をお願いします。

## ID/Pass
- ID: admin
- Pass: 1111

## テスト用アカウント
<購入者用>
- メールアドレス: b@gmail.com
- パスワード: 111111a
<購入用カード情報>
- 番号：4242424242424242
- 期限：Thu Nov 01 2029 00:00:00 GMT+0900 (JST)
- セキュリティコード：123
<出品者用>
- メールアドレス名: a@a
- パスワード: 111111a

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

# 開発環境
- Ruby 2.6.5p114
- Rails 6.0.4.7
- MySQL Ver 14.14
- Github 2.30.1
- VScode 1.66.2

# ローカルでの動作方法
git clone https://github.com/izureco/furima-37829.git

# 作成者
[@izureco]https://github.com/izureco
