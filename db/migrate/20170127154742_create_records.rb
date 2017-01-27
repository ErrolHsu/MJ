class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :user_id
      t.integer :game_id
      t.boolean :complete

      t.timestamps null: false
    end
    add_index :records, :user_id
    add_index :records, :game_id
  end
end
