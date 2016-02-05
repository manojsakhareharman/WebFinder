class RemoveTranslatedFields < ActiveRecord::Migration
  def up
    remove_column :brands, :description
    remove_column :brands, :contact_info_for_consultants
    remove_column :case_studies, :headline
    remove_column :case_studies, :description
    remove_column :case_studies, :content
    remove_column :landing_pages, :title
    remove_column :landing_pages, :subtitle
    remove_column :landing_pages, :description
    remove_column :landing_pages, :main_content
    remove_column :landing_pages, :left_content
    remove_column :landing_pages, :right_content
    remove_column :landing_pages, :sub_content
    remove_column :product_types, :name
    remove_column :product_types, :description
    remove_column :products, :name
    remove_column :products, :description
    remove_column :reference_systems, :name
    remove_column :reference_systems, :headline
    remove_column :reference_systems, :venue_size_descriptor
    remove_column :reference_systems, :description
    remove_column :site_settings, :content
    remove_column :venues, :name
    remove_column :venues, :description
    remove_column :vertical_markets, :name
    remove_column :vertical_markets, :headline
    remove_column :vertical_markets, :description
    remove_column :events, :name
    remove_column :events, :description
    remove_column :events, :page_content
  end

  def down
    add_column :brands, :description, :text
    add_column :brands, :contact_info_for_consultants, :text
    add_column :case_studies, :headline, :string
    add_column :case_studies, :description, :text
    add_column :case_studies, :content, :text
    add_column :landing_pages, :title, :string
    add_column :landing_pages, :subtitle, :string
    add_column :landing_pages, :description, :string
    add_column :landing_pages, :main_content, :text
    add_column :landing_pages, :left_content, :text
    add_column :landing_pages, :right_content, :text
    add_column :landing_pages, :sub_content, :text
    add_column :product_types, :name, :string
    add_column :product_types, :description, :text
    add_column :products, :name, :string
    add_column :products, :description, :text
    add_column :reference_systems, :name, :string
    add_column :reference_systems, :headline, :string
    add_column :reference_systems, :venue_size_descriptor, :string
    add_column :reference_systems, :description, :text
    add_column :site_settings, :content, :text
    add_column :venues, :name, :string
    add_column :venues, :description, :text
    add_column :vertical_markets, :name, :string
    add_column :vertical_markets, :headline, :string
    add_column :vertical_markets, :description, :text
    add_column :events, :name, :string
    add_column :events, :description, :text
    add_column :events, :page_content, :text
  end
end
