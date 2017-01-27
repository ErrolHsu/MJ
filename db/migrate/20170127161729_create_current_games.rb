class CreateCurrentGames < ActiveRecord::Migration
  def change
    create_table :current_games do |t|
      t.boolean :progress, default: :false

      t.timestamps null: false
    end
  end
end
