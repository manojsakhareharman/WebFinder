class AddIndexToSiteSettings < ActiveRecord::Migration
  def change
    add_index :site_settings, :name, unique: true
  end
end
