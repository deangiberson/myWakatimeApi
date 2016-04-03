class CreateRunningTotals < ActiveRecord::Migration
  def change
    create_table :running_totals do |t|
      t.references :leader, index: true, foreign_key: true
      t.integer :total_seconds
      t.integer :daily_average

      t.timestamps null: false
    end
  end
end
