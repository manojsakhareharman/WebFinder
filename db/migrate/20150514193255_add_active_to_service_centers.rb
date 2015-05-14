class AddActiveToServiceCenters < ActiveRecord::Migration
  def change
    add_column :service_centers, :active, :boolean, default: true
    add_index :service_centers, :active
  end
end
