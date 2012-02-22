class RenameAddSlotsToAdSlots < ActiveRecord::Migration
  def change
    rename_table :add_slots, :ad_slots
  end
end
