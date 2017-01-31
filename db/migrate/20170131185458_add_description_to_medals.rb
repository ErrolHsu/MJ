class AddDescriptionToMedals < ActiveRecord::Migration
  def change
  	add_column :medals, :description, :text
  end
end
