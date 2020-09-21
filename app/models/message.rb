class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user

  with_options presence: true do
    validates :content
  end
end
