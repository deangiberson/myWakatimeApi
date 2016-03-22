class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.boolean :logged_time_public
      t.boolean :languages_used_public
      t.boolean :email_public
      t.boolean :photo_public
    end
  end
end
