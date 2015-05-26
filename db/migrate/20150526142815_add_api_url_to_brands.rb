class AddApiUrlToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :api_url, :string
  end
end
