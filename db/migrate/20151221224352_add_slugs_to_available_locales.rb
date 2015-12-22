class AddSlugsToAvailableLocales < ActiveRecord::Migration
  def change
    add_column :available_locales, :slug, :string
    add_index :available_locales, :slug
  end
end
