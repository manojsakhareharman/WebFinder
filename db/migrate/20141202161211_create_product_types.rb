class CreateProductTypes < ActiveRecord::Migration
  def change
    create_table :product_types do |t|
      t.string :name
      t.text :description
      t.string :slug

      t.timestamps
    end
    add_index :product_types, :slug, unique: true
  end
end
