class RenameColumn < ActiveRecord::Migration
  def change
    rename_column :stream_slots, :add_slot_id, :ad_slot_id
  end
end
