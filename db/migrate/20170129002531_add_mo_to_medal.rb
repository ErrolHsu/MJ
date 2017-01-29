class AddMoToMedal < ActiveRecord::Migration
  def change
  	add_column :medals, :mo, :boolean, default: false
  end
end
