class AddCurrentGameIdToRecord < ActiveRecord::Migration
  def change
  	add_column :records, :current_game_id, :integer
  end
end
