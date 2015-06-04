require 'rails_helper'

RSpec.describe "vertical_markets/_buy.html.erb", :type => :view do

  before :all do
    @help_me_get_started = FactoryGirl.create(:site_setting, name: "button-help-me-get-started", content: "Help Me Get Started")
    FactoryGirl.create(:site_setting, name: 'store_link', content: 'http://shop.harmanpro.com')
    FactoryGirl.create(:site_setting, name: 'buy_direct_from_harman_headline', content: 'Buy Direct From Us')
    FactoryGirl.create(:site_setting, name: "buy_from_online_retailer_headline", content: "Buy From A Retailer")
    @retailer = FactoryGirl.create(:online_retailer)
    @vertical_market = FactoryGirl.create(:vertical_market)
    @reference_system = FactoryGirl.create(:reference_system, vertical_market: @vertical_market)
  end

  context "non-retail" do
    before do
      @reference_system.update_column(:retail, false)
      render partial: "vertical_markets/buy", locals: { vertical_market: @vertical_market }
    end

    it "should use infographic as 'buy' section" do
      expect(rendered).to have_css("img.infographic")
    end

    it "shows a leadgen button to help me get started" do
      expect(rendered).to have_link(@help_me_get_started.content, href: new_lead_path)
    end

    it "won't have retailer link" do
      expect(rendered).not_to have_content("Buy From A Retailer")
      expect(rendered).not_to have_content("Buy Direct From Us")
      expect(rendered).not_to have_link(@retailer.name, href: @retailer.url)
    end

  end

  context "retail" do
    before do
      @reference_system.update_column(:retail, true)

      render partial: "vertical_markets/buy", locals: { vertical_market: @vertical_market }
    end

    it "links to ecommerce store" do
      expect(rendered).to have_content("Buy Direct From Us")
      expect(rendered).to have_css("a[@href='http://shop.harmanpro.com']")
    end

    it "links to online retailers" do
      expect(rendered).to have_content("Buy From A Retailer")
      expect(rendered).to have_link(@retailer.name, href: @retailer.url)
      expect(rendered).to have_css("img[@src='#{@retailer.logo.url(:medium)}']")
    end
  end

end
