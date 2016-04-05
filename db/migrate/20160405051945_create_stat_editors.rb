class CreateStatEditors < ActiveRecord::Migration
  def change
    create_table :stat_editors do |t|
      t.references :stat, index: true, foreign_key: true
      t.string :name
      t.integer :total_seconds
      t.float :percent

      t.timestamps null: false
    end
  end
end
