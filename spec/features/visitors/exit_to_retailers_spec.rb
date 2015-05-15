require "rails_helper"

feature "Visitor exits to a retailer" do

  before :all do
    @vertical_market = FactoryGirl.create(:vertical_market)
    @reference_system = FactoryGirl.create(:reference_system, vertical_market: @vertical_market, retail: true)
    @store_link = FactoryGirl.create(:site_setting, name: 'store_link', content: "http://store.lvh.me")
    @retailer = FactoryGirl.create(:online_retailer)
  end

  before :each do
    visit vertical_market_path(@vertical_market)
  end

  scenario "harmanpro online store" do
    click_on "Shop Now"

    expect(current_url).to match(@store_link.content)
  end

  scenario "3rd party online retailer" do
    click_on @retailer.name

    expect(current_url).to match(@retailer.url)
  end
end