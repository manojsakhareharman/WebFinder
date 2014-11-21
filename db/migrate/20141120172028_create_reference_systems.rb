class CreateReferenceSystems < ActiveRecord::Migration
  def change
    create_table :reference_systems do |t|
      t.string :name
      t.integer :vertical_market_id
      t.boolean :retail, default: false
      t.integer :position
      t.string :venue_size_descriptor
      t.string :headline
      t.text :description

      t.timestamps
    end
    add_index :reference_systems, :vertical_market_id
  end
end
