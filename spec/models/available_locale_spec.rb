require 'rails_helper'

RSpec.describe AvailableLocale, type: :model do

  before :all do
    @loc = FactoryGirl.create(:available_locale)
  end

  subject { @loc }
  it { should respond_to :name }
  it { should respond_to :key }
  it { should respond_to :translators }
  it { should respond_to :items_to_translate }

  it "collects items_to_translate" do
    vertical_market = FactoryGirl.create(:vertical_market)
    reference_system = FactoryGirl.create(:reference_system)
    brand = FactoryGirl.create(:brand)
    case_study = FactoryGirl.create(:case_study)
    landing_page = FactoryGirl.create(:landing_page)
    product_type = FactoryGirl.create(:product_type)
    product = FactoryGirl.create(:product)
    venue = FactoryGirl.create(:venue)
    site_setting = FactoryGirl.create(:site_setting)

    expect(@loc.items_to_translate).to include(vertical_market)
    expect(@loc.items_to_translate).to include(reference_system)
    expect(@loc.items_to_translate).to include(brand)
    expect(@loc.items_to_translate).to include(case_study)
    expect(@loc.items_to_translate).to include(landing_page)
    expect(@loc.items_to_translate).to include(product_type)
    expect(@loc.items_to_translate).to include(product)
    expect(@loc.items_to_translate).to include(venue)
    expect(@loc.items_to_translate).to include(site_setting)
  end

  it "has custom menu items" do
    menu_item = FactoryGirl.create(:menu_item,
                                   locale: @loc,
                                   title: "Tienda",
                                   link: "http://shop.harmanpro.com",
                                   enabled: true,
                                   new_tab: true)
    expect(@loc.menu_items).to include(menu_item)
  end
end
