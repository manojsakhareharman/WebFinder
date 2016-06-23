class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.text :description
      t.text :overview
      t.string :photo_file_name
      t.integer :photo_file_size
      t.string :photo_content_type
      t.datetime :photo_updated_at
      t.integer :locale_id

      t.timestamps null: false
    end
    add_index :artists, :locale_id
  end
end
