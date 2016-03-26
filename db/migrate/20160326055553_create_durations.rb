class CreateDurations < ActiveRecord::Migration
  def change
    create_table :durations do |t|
      t.references :user, index: true, foreign_key: true
      t.string :project
      t.decimal :time
      t.integer :duration
      t.string :branch

      t.timestamps null: false
    end
  end
end
