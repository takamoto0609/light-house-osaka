class Room < ApplicationRecord
  # has_many :room_users
  # has_many :users, through: :room_users
  belongs_to :user
  has_many :messages

  with_options presence: true do
    validates :name
    validates :content
  end
end
