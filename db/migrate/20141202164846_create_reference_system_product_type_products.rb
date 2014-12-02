class CreateReferenceSystemProductTypeProducts < ActiveRecord::Migration
  def change
    create_table :reference_system_product_type_products do |t|
      t.integer :reference_system_product_type_id
      t.integer :product_id

      t.timestamps
    end
    add_index :reference_system_product_type_products, :reference_system_product_type_id, name: "r_s_p_t_id"
  end
end
