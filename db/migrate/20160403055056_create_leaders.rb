class CreateLeaders < ActiveRecord::Migration
  def change
    create_table :leaders do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :rank

      t.timestamps null: false
    end
  end
end
