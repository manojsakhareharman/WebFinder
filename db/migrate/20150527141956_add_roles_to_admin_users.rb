class AddRolesToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :service_department, :boolean, default: false
    add_column :admin_users, :super_admin, :boolean, default: true
  end
end
