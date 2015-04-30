class AddWhiteLogoToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :white_logo_file_name, :string
    add_column :brands, :white_logo_file_size, :integer
    add_column :brands, :white_logo_content_type, :string
    add_column :brands, :white_logo_updated_at, :datetime
  end
end
