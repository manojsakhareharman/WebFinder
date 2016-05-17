class AddCustomSlugToLandingPages < ActiveRecord::Migration
  def change
    add_column :landing_pages, :custom_slug, :string
  end
end
