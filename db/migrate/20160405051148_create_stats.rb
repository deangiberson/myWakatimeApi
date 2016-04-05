class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.references :user, index: true, foreign_key: true
      t.string :range
      t.integer :holidays
      t.string :status
      t.boolean :is_already_updating
      t.boolean :is_stuck
      t.boolean :is_up_to_date
      t.integer :start
      t.integer :end
      t.string :timezone
      t.integer :timeout
      t.boolean :writes_only
      t.integer :total_seconds
      t.integer :daily_average

      t.timestamps null: false
    end
  end
end
