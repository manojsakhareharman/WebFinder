class AddByHarmanLogoToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :by_harman_logo_file_name, :string
    add_column :brands, :by_harman_logo_file_size, :integer
    add_column :brands, :by_harman_logo_updated_at, :datetime
    add_column :brands, :by_harman_logo_content_type, :string
  end
end
