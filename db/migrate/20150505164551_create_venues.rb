class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.text :description
      t.string :left
      t.string :top
      t.string :slug

      t.timestamps null: false
    end
    add_index :venues, :slug
  end
end
