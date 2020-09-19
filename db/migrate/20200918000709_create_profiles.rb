class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string     :family_name,       null: false
      t.string     :given_name,        null: false
      t.string     :family_name_kana,  null: false
      t.string     :given_name_kana,   null: false
      t.integer    :sex_id,            null: false
      t.integer    :blood_type_id,     null: false
      t.integer    :birth_day,         null: false
      t.integer    :address_id,        null: false #住んでいる地域
      t.integer    :occupation_id,     null: false #職業
      t.string     :work_place,        null: false #勤務先
      t.text       :summary,           null: false #自己紹介
      t.references :user,              null: false,foreign_key: true
      t.timestamps
    end
  end
end
