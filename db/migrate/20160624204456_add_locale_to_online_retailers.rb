class AddLocaleToOnlineRetailers < ActiveRecord::Migration
  def change
    add_column :online_retailers, :locale_id, :integer
    add_index :online_retailers, :locale_id
  end
end
