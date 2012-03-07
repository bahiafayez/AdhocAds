class AddDescriptionToLiveStreams < ActiveRecord::Migration
  def change
    add_column :live_streams, :description, :text
  end
end
