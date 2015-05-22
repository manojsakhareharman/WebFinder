class AddConsultantFlagToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :show_on_consultant_page, :boolean

    Brand.where("downloads_page_url IS NOT NULL AND downloads_page_url != ''").update_all(show_on_consultant_page: true)
  end
end
