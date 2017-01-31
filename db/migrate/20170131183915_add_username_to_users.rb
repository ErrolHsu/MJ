class AddUsernameToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :account, :string
  end
end
