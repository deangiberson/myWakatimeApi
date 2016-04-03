class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.references :running_total, index: true, foreign_key: true
      t.string :name
      t.integer :total_seconds

      t.timestamps null: false
    end
  end
end
