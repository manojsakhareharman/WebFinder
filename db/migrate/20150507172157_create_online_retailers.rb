class CreateOnlineRetailers < ActiveRecord::Migration
  def change
    create_table :online_retailers do |t|
      t.string :name
      t.string :slug
      t.string :url
      t.string :logo_file_name
      t.integer :logo_file_size
      t.string :logo_content_type
      t.datetime :logo_updated_at

      t.timestamps null: false
    end
    add_index :online_retailers, :slug
  end
end
