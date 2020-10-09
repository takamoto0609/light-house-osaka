class Profile < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :sex
  belongs_to_active_hash :blood_type
  belongs_to_active_hash :address
  belongs_to_active_hash :occupation
  belongs_to_active_hash :zodiac_sign
  belongs_to_active_hash :age_group

  with_options presence: true do
    validates :sex_id
    validates :blood_type_id
    validates :birth_day
    validates :zodiac_sign_id
    validates :age_group_id
    validates :address_id
    validates :occupation_id
    validates :work_place
    validates :summary
  end
end
