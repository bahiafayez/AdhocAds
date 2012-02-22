class CreateAdSlots < ActiveRecord::Migration
  def change
    create_table :ad_slots do |t|
      t.time :time

      t.timestamps
    end
  end
end
