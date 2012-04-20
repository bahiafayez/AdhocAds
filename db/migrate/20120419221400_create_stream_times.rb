class CreateStreamTimes < ActiveRecord::Migration
  def change
    create_table :stream_times do |t|
      t.datetime :polltime
      t.integer :stream
      t.integer :user

      t.timestamps
    end
  end
end
