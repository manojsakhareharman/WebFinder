class CreateServiceGroups < ActiveRecord::Migration
  def change
    create_table :service_groups do |t|
      t.string :name
      t.integer :brand_id

      t.timestamps null: false
    end
    add_index :service_groups, :brand_id
  end
end
