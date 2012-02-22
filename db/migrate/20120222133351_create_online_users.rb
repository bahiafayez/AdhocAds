class CreateOnlineUsers < ActiveRecord::Migration
  def change
    create_table :online_users do |t|
      t.string :name
      t.integer :plan_id

      t.timestamps
    end
  end
end
