class AddSlugsToReferenceSystems < ActiveRecord::Migration
  def change
    add_column :reference_systems, :slug, :string
    add_index :reference_systems, :slug, unique: true
  end
end
