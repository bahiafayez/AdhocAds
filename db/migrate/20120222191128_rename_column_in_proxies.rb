class RenameColumnInProxies < ActiveRecord::Migration
  def change
    rename_column :proxies, :IP, :ip
  end
end
