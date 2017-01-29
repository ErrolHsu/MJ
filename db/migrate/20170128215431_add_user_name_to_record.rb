class AddUserNameToRecord < ActiveRecord::Migration
  def change
  	add_column :records, :user_name, :string
  end
end
