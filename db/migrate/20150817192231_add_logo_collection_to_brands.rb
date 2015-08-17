class AddLogoCollectionToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :logo_collection_file_name, :string
    add_column :brands, :logo_collection_file_size, :integer
    add_column :brands, :logo_collection_content_type, :string
    add_column :brands, :logo_collection_updated_at, :datetime
  end
end
