class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_id
      t.string :username
      t.string :email
      t.string :timezone
      t.integer :plan
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.references :profile, index: true, foreign_key: true
    end
  end
end
