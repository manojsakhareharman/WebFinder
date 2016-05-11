class AddCodeToLandingPages < ActiveRecord::Migration
  def change
    add_column :landing_pages, :header_code, :text
    add_column :landing_pages, :footer_code, :text
  end
end
