class CreateAdUsers < ActiveRecord::Migration
  def change
    create_table :ad_users do |t|
      t.integer :online_user_id
      t.integer :ad_id
      t.integer :order
      t.boolean :played

      t.timestamps
    end
  end
end
