class Profile < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :sex
  belongs_to_active_hash :blood_type
  belongs_to_active_hash :address
  belongs_to_active_hash :occupation
  belongs_to_active_hash :zodiac_sign
  belongs_to_active_hash :age_group
end
