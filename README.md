## 新社会人のBuffアプリ
![README_img](https://user-images.githubusercontent.com/68495404/97948989-85811180-1dd5-11eb-9f2f-14ca3792e598.jpg)

## 概要
何でも相談できるメンターと繋がることができます。<br>
仕事やプライベートの様々な悩み、本音で相談できていますか？そしてちゃんと解決できていますか？<br>
「YES！」と即答できないあなた、サクッとBaffアプリで相談しましょう！

## テストアカウント
[URL https://light-house-osaka.herokuapp.com/](https://light-house-osaka.herokuapp.com/)
### ユーザー側のテストアカウント
* メールアドレス<br>
      user@test
* パスワード<br>
      usertest
### メンター側のテストアカウント
* メールアドレス<br>
      mentor@test
* パスワード<br>
      mentortest
### 管理人室に入るためのベーシック認証
* ID<br>
      mentor
* パスワード<br>
      osaka

## 主な機能
### ユーザー
* 相談ルームを作り、メンターとチャットができます。
* 相談ルームのタイトル、内容を編集できます。

### メンター
* ユーザーのプロフィール検索ができます。
* 全ての相談ルームに入り、相談者であるユーザーとチャットができます。

### 管理人
* ユーザーとして登録後、管理画面でユーザーとメンターの切り替えができます。

### 共通して使える機能
* ユーザー登録、ログイン、ログアウトができます。
* プロフィール作成・編集ができます。
* メンター一覧を見ることができます。
* ライブラリ(お役立ち情報)を見ることができます。

### 制作背景
* 新社会人が何かで悩んだ時に、利害関係抜きで何でも相談できるメンター的な存在がいれば良いなと思いました。
* 他にも相談に乗ってくれる掲示板やチャットアプリはありますが、起こってしまったことに対してのアドバイスが多く、そもそもの原因を改善するアドバイスは少ないように見受けられます。お金がなくて困っている人を助けたかったら、お金を渡すのではなく稼げるようにしてあげることが必要だと考えております。
* このアプリはユーザーがメンターとマッチングし、悩みを解決する考え方や強いメンタルを手に入れ人生を楽々渡れるようになることを目的としています。

### 工夫したポイント
* 相談ルームに回答があるとひと目で分かるようにしました。
* 画面遷移を減らすために、新規ルーム作成とルーム一覧表示にモーダルを使用しました。

## 仕様
* rails 6.0.0
* JavaScript
* bootstrap

## 課題や今後実装したい機能
### メンターが使える機能の改善
* 名前検索ができないため、今後実装予定です。
* ユーザーが増えた場合、検索条件をプルダウンで選択する方式だと時間がかかるため、ID検索など一部の検索条件を手入力に変更する予定です。

## DB設計

### users テーブル

| Column                     | Type       | Options                        |
| -------------------------- | ---------- | ------------------------------ |
| family_name                | string     | null: false                    |
| given_name                 | string     | null: false                    |
| family_name_kana           | string     | null: false                    |
| given_name_kana            | string     | null: false                    |
| mentor                     | integer    | null: false, default: 1        |
| email                      | string     | null: false, default: ""       |
| encrypted_password         | string     | null: false, default: ""       |

### Association

- has_many :rooms
- has_many :messages
- has_one  :profile

### rooms テーブル

| Column                     | Type       | Options                        |
| -------------------------- | ---------- | ------------------------------ |
| name                       | string     | null: false                    |
| content                    | string     | null: false                    |
| status                     | integer    | null: false, default: 0        |
| user                       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :messages

### messages テーブル

| Column                     | Type       | Options                        |
| -------------------------- | ---------- | ------------------------------ |
| content                    | string     | null: false                    |
| user                       | references | null: false, foreign_key: true |
| room                       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :room

### profiles テーブル

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




