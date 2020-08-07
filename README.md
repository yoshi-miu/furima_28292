# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions


# テーブル設計

## Users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birthday        | date   | null: false |

### Association

- has_many :items
- has_many :comments
- has_many  :purchase

## Items テーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| name        | string  | null: false |
| price       | integer | null: false |
| description | string  | null: false |
| user        | references | null: false, foreign_key: true |
| genre_id    | integer | null: false |
| status_id   | integer | null: false |
| bear_id     | integer | null: false |
| area_id     | integer | null: false |
| shipment_id | integer | null: false |

### Association

- belongs_to :user
- has_many :comments
- has_one_attached :image
- has_one :purchase
- has_one :shipment

## Comments テーブル

| Column | Type        | Options                        |
| ------ | ----------- | ------------------------------ |
| user   | references  | null: false, foreign_key: true |
| item   | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## Purchases

| Column | Type        | Options                        |
| ------ | ----------- | ------------------------------ |
| user   | references  | null: false, foreign_key: true |
| item   | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## Shipments

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| postal_code  | string  | null: false |
| area_id      | integer | null: false |
| address_1    | string  | null: false |
| address_2    | string  | null: false |
| address_3    | string  | null: false |
| phone_number | string  | null: false |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :item

