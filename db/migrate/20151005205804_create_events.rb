class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :start_on
      t.date :end_on
      t.text :description
      t.boolean :featured
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.boolean :active

      t.timestamps null: false
    end
  end
end
