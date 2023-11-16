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

* ...

# テーブル設計

## users テーブル

| Column                | Type   | Options                   |
| --------------------- | ------ | ------------------------- |
| name                  | string | null: false               |
| email                 | string | null: false, unique: true |
| encrypted_password    | string | null: false               |
| password confirmation | string | null: false               |
| familyname_kanji      | string | null: false               |
| firstname_kanji       | string | null: false               |
| familyname_katakana   | string | null: false               |
| firstname_katakana    | string | null: false               |
| birthday              | date   | null: false               |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column        | Type       | Options                         |
| ------------- | ---------- | ------------------------------- |
| item_name     | string     | null: false                     |
| explain       | text       | null: false                     |
| category_id   | string     | numericality: { other_than: 1 } |
| situation_id  | string     | numericality: { other_than: 1 } |
| postage_id    | string     | numericality: { other_than: 1 } |
| prefecture_id | string     | numericality: { other_than: 1 } |
| amountdays_id | string     | numericality: { other_than: 1 } |
| price         | integer    | null: false                     |
| user          | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :buy

## buys テーブル

| Column | Type       | Options                         |
| ------ | ---------- | ------------------------------- |
| user   | references | null: false, foreign_key: true  |
| item   | references | null: false, foreign_key: true  |


### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## addresses テーブル

| Column        | Type       | Options                         |
| ------------- | ---------- | ------------------------------- |
| zip           | string     | null: false                     |
| prefecture_id | string     | numericality: { other_than: 1 } |
| city          | string     | null: false                     |
| address       | string     | null: false                     |
| building      | string     |                                 |
| telephone     | string     | null: false                     |

### Association

- belongs_to :buy