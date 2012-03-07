class RemoveColumnPlanIdFromOnlineUsers < ActiveRecord::Migration
  def change
    remove_column :online_users, :plan_id
  end
end
