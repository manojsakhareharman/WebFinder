class AddContactNameToServiceCenters < ActiveRecord::Migration
  def change
    add_column :service_centers, :contact_name, :string
  end
end
