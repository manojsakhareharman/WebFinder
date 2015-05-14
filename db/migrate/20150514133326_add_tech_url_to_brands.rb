class AddTechUrlToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :tech_url, :string
    add_column :brands, :show_on_main_site, :boolean, default: true
    add_column :brands, :show_on_services_site, :boolean, default: true

    add_index :brands, :show_on_main_site
    add_index :brands, :show_on_services_site
  end
end
