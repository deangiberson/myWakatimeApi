class CreateStatOperatingSystems < ActiveRecord::Migration
  def change
    create_table :stat_operating_systems do |t|
      t.references :stat, index: true, foreign_key: true
      t.string :name
      t.integer :total_seconds
      t.float :percent

      t.timestamps null: false
    end
  end
end
