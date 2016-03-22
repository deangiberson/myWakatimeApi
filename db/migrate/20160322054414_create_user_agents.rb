class CreateUserAgents < ActiveRecord::Migration
  def change
    create_table :user_agents do |t|
      t.references :user, index: true, foreign_key: true
      t.string :user_agent
      t.string :editor
      t.string :version
      t.string :os
      t.datetime :last_seen

      t.timestamps null: false
    end
  end
end
