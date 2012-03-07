class AdsTags < ActiveRecord::Migration
  def up
    create_table :ads_tags do |t|
      t.references :ad
      t.references :tag
    end
  end

  def down
    drop_table :ads_tags
  end
end
