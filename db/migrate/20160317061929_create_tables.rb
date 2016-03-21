class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :access_token null: false

      t.timestamps null: false
    end

  def change
    create_table :users do |t|
      t.string :user_id null: false
      t.string :username null: false
      t.string :email
      t.string :timezone
      t.integer :plan

      t.timestamps null: false
    end

    create_table :profiles do |t|
      t.boolean :logged_time_public
      t.boolean :languages_used_public
      t.boolean :email_public
      t.boolean :photo_public

      t.timestamps null: false
    end

    add_reference :users, :profile, index: true, foreign_key: true
    add_reference :api_keys, :user, index: true, foreign_key: true
  end
end
