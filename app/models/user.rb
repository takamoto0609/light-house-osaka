class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages
  has_one  :profile

  validates :family_name,      presence: true
  validates :given_name,       presence: true
  validates :family_name_kana, presence: true
  validates :given_name_kana,  presence: true
end

# class User < ActiveRecord::Base

#   # creatable_by?(user)などのメソッドが利用できるようになる。
#   include Authority::Abilities

#   # can_create?(resource)などのメソッドが利用できるようになる。
#   include Authority::UserAbilities

#   # 権限の設定は、/app/authorizers/user_authorizer.rbを参照する
#   self.authorizer_name = 'UserAuthorizer'

#   # roleを適用したいmodelの中に記載
#   resourcify

#   #以下のコールバックが利用できるようになる。
#   rolify
#   # Userを追加した際にデフォルトでeditor roleを割り当てるための設定。
#   # 他にも、削除する前、削除した後、作成する前、作成した後といったコールバックが用意されている。
#   after_create :assign_default_role

#   def assign_default_role
#     self.add_role(:editor)
#   end

#   # Include default devise modules. Others available are:
#   # :confirmable, :lockable, :timeoutable and :omniauthable
#   devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable#, :confirmable
# end