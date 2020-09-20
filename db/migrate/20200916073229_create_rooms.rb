class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      
      t.string :name,    null: false
      t.text   :content, null: false
      t.references :user, foreign_key: true
      t.integer :status, null: false, default: 0
      t.timestamps
    end
  end
end
