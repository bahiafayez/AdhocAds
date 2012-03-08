class CreateLiveStreams < ActiveRecord::Migration
  def change
    create_table :live_streams do |t|
      t.string :publishing_point
      t.integer :proxy_id
      t.string :name
      t.string :status
      t.string :url

      t.timestamps
    end
  end
end
