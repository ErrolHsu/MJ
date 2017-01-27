class AddStateToCurrentGame < ActiveRecord::Migration
  def change
  	add_column :current_games, :state, :integer, default: 0
  end
end
