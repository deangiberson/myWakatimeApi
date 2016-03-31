class CreateHeartbeats < ActiveRecord::Migration
  def change
    create_table :heartbeats do |t|
      t.references :user, index: true, foreign_key: true
      t.string :entity
      t.string :entity_type
      t.decimal :time
      t.string :project
      t.string :branch
      t.string :language
      t.string :dependencies
      t.integer :lines
      t.integer :lineno
      t.integer :cursorpos
      t.boolean :is_write
      t.boolean :is_debugging

      t.timestamps null: false
    end
  end
end
