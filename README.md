# README

## オリジナルアプリ名
### 新社会人のBuffアプリ

## 概要
### ユーザー
### ・相談ルームを作り、メンターとチャットができます。
### ・管理画面でユーザーとメンターの切り替えができます。

## メンター切り替え後
### ・プロフィール検索ができます。
### ・全ての相談ルームに入り、相談者であるユーザーとチャットができます。

## 本番環境
### URL https://light-house-osaka.herokuapp.com/
### テストアカウント
### ID user@test
### PW usertest
### 管理人室に入るためのベーシック認証
### ID mentor
### PW osaka

## 制作背景
### 新社会人が何かで悩んだ時に、利害関係を考えず何でも相談できるメンター的な存在がいれば良いなと思いました。
### 他にも相談に乗ってくれる掲示板などのサイトはありますが、誰がどんな意図で返信してくれるのか不明瞭ですし、不特定多数が見る掲示板だと書けない事情も多いと思います。
### よってこのサイトはチャットがメインではなく、メンターとマッチングすることを目的としています。

## 工夫したポイント
### 全く初めてのユーザーが操作で迷わないように適宜説明を追加しました。
### 画面遷移をなくすために、新規ルーム作成とルーム一覧表示にモーダルを使用しました。

## 使用技術
### rails 6.0.0
### JavaScript
### bootstrap

## 課題や今後実装したい機能
### ユーザー・メンター共に使える機能の改善
### ・メッセージの編集機能・削除機能を実装予定です。
### ユーザーが使える機能の改善
### ・相談ルームの編集機能・削除機能を実装予定です。
### メンターが使える機能の改善
### ・名前検索ができないため、今後実装予定です。

## DB設計

## users テーブル

| Column                     | Type       | Options                        |
| -------------------------- | ---------- | ------------------------------ |
| family_name                | string     | null: false                    |
| given_name                 | string     | null: false                    |
| family_name_kana           | string     | null: false                    |
| given_name_kana            | string     | null: false                    |
| mentor                     | integer    | null: false, default: 0        |
| email                      | string     | null: false, default: ""       |
| encrypted_password         | string     | null: false, default: "" |

### Association

- has_many :rooms
- has_many :messages
- has_one  :profile

## rooms テーブル

| Column                     | Type       | Options                        |
| -------------------------- | ---------- | ------------------------------ |
| name                       | string     | null: false                    |
| content                    | string     | null: false                    |
| status                     | integer    | null: false, default: 0        |
| user                       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :messages

## messages テーブル

| Column                     | Type       | Options                        |
| -------------------------- | ---------- | ------------------------------ |
| content                    | string     | null: false                    |
| user                       | references | null: false, foreign_key: true |
| room                       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :room

## profiles テーブル

| Column                     | Type       | Options                        |
| -------------------------- | ---------- | ------------------------------ |
| sex_id                     | integer    | null: false                    |
| blood_type_id              | integer    | null: false                    |
| zodiac_sign_id             | integer    | null: false                    |
| age_group_id               | integer    | null: false                    |
| address_id                 | integer    | null: false                    |
| occupation_id              | integer    | null: false                    |
| birth_day                  | integer    | null: false                    |
| work_place                 | string     | null: false                    |
| summary                    | text       | null: false                    |
| user                       | references | null: false, foreign_key: true |

### Association
- belongs_to :user




