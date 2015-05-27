class CreateServiceCenterServiceGroups < ActiveRecord::Migration
  def change
    create_table :service_center_service_groups do |t|
      t.integer :service_center_id
      t.integer :service_group_id

      t.timestamps null: false
    end
    add_index :service_center_service_groups, :service_center_id
    add_index :service_center_service_groups, :service_group_id
  end
end
