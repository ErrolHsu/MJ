class AddPointToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :point, :float, default: 0.0
  end
end
