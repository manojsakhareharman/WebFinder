class AddHiddenTitleToLandingPages < ActiveRecord::Migration
  def change
    add_column :landing_pages, :hide_title, :boolean
  end
end
