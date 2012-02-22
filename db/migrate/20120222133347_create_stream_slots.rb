class CreateStreamSlots < ActiveRecord::Migration
  def change
    create_table :stream_slots do |t|
      t.integer :live_stream_id
      t.integer :add_slot_id
      t.integer :duration

      t.timestamps
    end
  end
end
