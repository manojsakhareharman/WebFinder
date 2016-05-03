class AddOriginalLocaleToLandingPages < ActiveRecord::Migration
  def change
    add_column :landing_pages, :original_locale_id, :integer
    add_index :landing_pages, :original_locale_id
  end
end
