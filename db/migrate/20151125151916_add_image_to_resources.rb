class AddImageToResources < ActiveRecord::Migration
  def change
    add_column :resources, :image_file_name, :string
    add_column :resources, :image_content_type, :string
    add_column :resources, :image_updated_at, :datetime
    add_column :resources, :image_file_size, :integer
  end
end
