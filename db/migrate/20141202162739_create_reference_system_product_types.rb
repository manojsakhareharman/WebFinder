class CreateReferenceSystemProductTypes < ActiveRecord::Migration
  def change
    create_table :reference_system_product_types do |t|
      t.integer :reference_system_id
      t.integer :product_type_id
      t.integer :quantity

      t.timestamps
    end
    add_index :reference_system_product_types, :reference_system_id
  end
end
