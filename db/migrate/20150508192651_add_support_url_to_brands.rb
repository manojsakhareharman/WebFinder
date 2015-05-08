class AddSupportUrlToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :support_url, :string
  end
end
