class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :access_token, null: false, uniq: true
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.references :user, index: true, foreign_key: true
    end
  end
end
