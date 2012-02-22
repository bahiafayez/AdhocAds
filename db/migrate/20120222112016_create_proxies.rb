class CreateProxies < ActiveRecord::Migration
  def change
    create_table :proxies do |t|
      t.string :IP
      t.integer :port

      t.timestamps
    end
  end
end
