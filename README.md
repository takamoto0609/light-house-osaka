### 新社会人のBuffアプリ
![](https://gyazo.com/5678a65d6e0a68716ca345073580d97b)

## 概要

## テストアカウント
[URL https://light-house-osaka.herokuapp.com/](https://light-house-osaka.herokuapp.com/)
#### ユーザー側のテストアカウント
* ID user@test
* PW usertest
#### メンター側のテストアカウント
* ID mentor@test
* PW mentortest
#### 管理人室に入るためのベーシック認証
* ID mentor
* PW osaka

### 管理人のみ使える機能
* ユーザーとして登録後、管理画面でユーザーとメンターの切り替えができます。

### ユーザーのみ使える機能
* 相談ルームを作り、メンターとチャットができます。
* 相談ルームのタイトル、内容を編集できます。

### メンターのみ使える機能
* ユーザーのプロフィール検索ができます。
* 全ての相談ルームに入り、相談者であるユーザーとチャットができます。

### 共通して使える機能
* ・プロフィール作成・編集ができます。
* ・メンター一覧を見ることができます。
* ・ライブラリ(お得情報)を見ることができます。

### 制作背景
* 新社会人が何かで悩んだ時に、利害関係抜きで何でも相談できるメンター的な存在がいれば良いなと思いました。
* 他にも相談に乗ってくれる掲示板やチャットアプリはありますが、起こってしまったことに対してのアドバイスが多く、そもそもの原因を改善するアドバイスは少ないように見受けられます。お金がなくて困っている人を助けたかったら、お金を渡すのではなく稼げるようにしてあげることが必要だと考えております。
* よってこのアプリはチャットがメインではなく、ユーザーがメンターとマッチングすることを目的としています。

### 工夫したポイント
* 全く初めてのユーザーが操作で迷わないように適宜説明を追加しました。
* 画面遷移をなくすために、新規ルーム作成とルーム一覧表示にモーダルを使用しました。

### 使用技術
* rails 6.0.0
* JavaScript
* bootstrap

### 課題や今後実装したい機能
* メンターが使える機能の改善
* 名前検索ができないため、今後実装予定です。
* ユーザーが増えた場合、検索条件をプルダウンで選択する方式だと時間がかかるため、ID検索など一部の検索条件を手入力に変更する予定です。

### DB設計

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




