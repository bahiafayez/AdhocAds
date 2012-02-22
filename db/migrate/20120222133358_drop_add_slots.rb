class DropAddSlots < ActiveRecord::Migration
  def change
    drop_table :add_slots
  end
end
