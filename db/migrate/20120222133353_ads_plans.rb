class AdsPlans < ActiveRecord::Migration
  def up
    create_table :ads_plans do |t|
      t.references :ad
      t.references :plan
      t.timestamps
    end
  end

  def down
    drop_table :ads_plans
  end
end
