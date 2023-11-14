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

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| name_kanji         | string | null: false |
| name_katakana      | string | null: false |
| birthday           | string | null: false |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| Item_name  | string     | null: false                    |
| explain    | string     | null: false                    |
| category   | string     | null: false                    |
| situation  | string     | null: false                    |
| postage    | string     | null: false                    |
| amountdays | string     | null: false                    |
| price      | string     | null: false                    |
| user_id    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buy

## buys テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| zip        | string     | null: false                    |
| prefecture | string     | null: false                    |
| city       | string     | null: false                    |
| address    | string     | null: false                    |
| building   | string     |                                |
| telephone  | string     | null: false                    |
| user_id    | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user