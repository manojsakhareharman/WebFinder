class AddConsultantContactInfoToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :contact_info_for_consultants, :text
  end
end
