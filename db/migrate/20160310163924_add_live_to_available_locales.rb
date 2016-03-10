class AddLiveToAvailableLocales < ActiveRecord::Migration
  def change
    add_column :available_locales, :live, :boolean
  end
end
