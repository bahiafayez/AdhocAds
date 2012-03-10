class CreateAdSlots < ActiveRecord::Migration
  def change
    create_table :ad_slots do |t|
      t.time :time, :default => Time.now

      t.timestamps
    end
  end
end
