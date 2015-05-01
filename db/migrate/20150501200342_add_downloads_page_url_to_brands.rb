class AddDownloadsPageUrlToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :downloads_page_url, :string
  end
end
