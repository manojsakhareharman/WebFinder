class AddSlugToTranslatables < ActiveRecord::Migration
  def up
    CaseStudy.add_translation_fields! slug: :string
    Event.add_translation_fields! slug: :string
    LandingPage.add_translation_fields! slug: :string
    ProductType.add_translation_fields! slug: :string
    Product.add_translation_fields! slug: :string
    ReferenceSystem.add_translation_fields! slug: :string
    Venue.add_translation_fields! slug: :string
    VerticalMarket.add_translation_fields! slug: :string
  end

  def down
    remove_column :case_study_translations, :slug
    remove_column :event_translations, :slug
    remove_column :landing_page_translations, :slug
    remove_column :product_type_translations, :slug
    remove_column :product_translations, :slug
    remove_column :reference_system_translations, :slug
    remove_column :venue_translations, :slug
    remove_column :vertical_market_translations, :slug
  end
end
