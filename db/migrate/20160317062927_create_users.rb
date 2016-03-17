class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_id
      t.string :username
      t.string :email
      t.string :timezone
      t.integer :plan
      t.boolean :logged_time_public
      t.boolean :languages_used_public
      t.boolean :email_public
      t.boolean :photo_public

      t.timestamps null: false
    end
  end
end
