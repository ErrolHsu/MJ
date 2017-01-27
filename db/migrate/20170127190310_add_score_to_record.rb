class AddScoreToRecord < ActiveRecord::Migration
  def change
  	add_column :records, :score, :integer
  end
end
