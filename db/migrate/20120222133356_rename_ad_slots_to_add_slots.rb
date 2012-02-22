class RenameAdSlotsToAddSlots < ActiveRecord::Migration
  def change
    rename_table :ad_slots, :add_slots
  end
end
