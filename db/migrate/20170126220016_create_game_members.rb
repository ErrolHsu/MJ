class CreateGameMembers < ActiveRecord::Migration
  def change
    create_table :game_members do |t|
      t.integer :game_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
