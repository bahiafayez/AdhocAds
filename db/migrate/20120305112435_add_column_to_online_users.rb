class AddColumnToOnlineUsers < ActiveRecord::Migration
  def change
    add_column :online_users, :facebook_id, :string
  end
end
