class AddTranslatorToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :translator, :boolean
  end
end
