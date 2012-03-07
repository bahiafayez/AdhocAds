class OnlineUsersTags < ActiveRecord::Migration
  def up
    create_table :online_users_tags do |t|
      t.references :online_user
      t.references :tag
      
    end
  end

  def down
    drop_table :online_users_tags
  end
end
