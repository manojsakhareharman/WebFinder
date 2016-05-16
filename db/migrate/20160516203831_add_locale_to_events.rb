class AddLocaleToEvents < ActiveRecord::Migration
  def change
    add_column :events, :original_locale_id, :integer
    add_index :events, :original_locale_id
  end
end
