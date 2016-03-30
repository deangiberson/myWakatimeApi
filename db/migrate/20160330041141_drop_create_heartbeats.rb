class DropCreateHeartbeats < ActiveRecord::Migration
  def change
    drop_table :create_heartbeats
  end
end
