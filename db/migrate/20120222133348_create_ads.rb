class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :url
      t.integer :duration
      t.text :description

      t.timestamps
    end
  end
end
