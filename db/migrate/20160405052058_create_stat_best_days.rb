class CreateStatBestDays < ActiveRecord::Migration
  def change
    create_table :stat_best_days do |t|
      t.references :stat, index: true, foreign_key: true
      t.string :date
      t.integer :total_seconds

      t.timestamps null: false
    end
  end
end
