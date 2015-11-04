class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :name
      t.string :attachment_file_name
      t.string :attachment_content_type
      t.datetime :attachment_updated_at
      t.integer :attachment_file_size
      t.string :resource_type

      t.timestamps null: false
    end
  end
end
