class CreateMedals < ActiveRecord::Migration
  def change
    create_table :medals do |t|
      t.string :name
      t.float :point
      t.integer :user_id, index: true
      t.integer :record_id, index: true

      t.timestamps null: false
    end
  end
end
