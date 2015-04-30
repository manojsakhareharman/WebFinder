class AddLogoToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :logo_file_name, :string
    add_column :brands, :logo_content_type, :string
    add_column :brands, :logo_file_size, :integer
    add_column :brands, :logo_updated_at, :datetime
  end
end
