class AddCoordinatesToReferenceSystemProductTypes < ActiveRecord::Migration
  def change
    add_column :reference_system_product_types, :top, :string
    add_column :reference_system_product_types, :left, :string
  end
end
