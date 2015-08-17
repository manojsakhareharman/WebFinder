class AddMarketingUrlToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :marketing_url, :string
  end
end
