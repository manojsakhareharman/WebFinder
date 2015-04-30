require "rails_helper"

feature "Sitemap" do

  before :all do
    @brand = FactoryGirl.create(:brand)
    @vertical_market = FactoryGirl.create(:vertical_market)
    @reference_system = FactoryGirl.create(:reference_system, vertical_market: @vertical_market)
    @case_study = FactoryGirl.create(:case_study, vertical_market: @vertical_market)
  end

  context "XML output" do
    before do
      visit sitemap_path(format: 'xml')
    end

    scenario "links to brand page" do
      expect(page).to have_selector("loc", text: brand_path(@brand))
    end

    scenario "links to vertical market page" do
      expect(page).to have_selector("loc", text: vertical_market_path(@vertical_market))
    end

    scenario "links to reference system page" do
      expect(page).to have_selector("loc", text: vertical_market_reference_system_path(@vertical_market, @reference_system))
    end

    scenario "links to case study page" do
      expect(page).to have_selector("loc", text: vertical_market_case_study_path(@vertical_market, @case_study))
    end
  end

  context "HTML output" do
    before do
      visit sitemap_path(format: 'html')
    end

    scenario "it links to brand page" do
      expect(page).to have_link(@brand.name, href: brand_path(@brand))
    end

    scenario "links to vertical market page" do
      expect(page).to have_link(@vertical_market.name, href: vertical_market_path(@vertical_market))
    end

    scenario "links to reference system page" do
      expect(page).to have_link(@reference_system.name, href: vertical_market_reference_system_path(@vertical_market, @reference_system))
    end

    scenario "links to case study page" do
      expect(page).to have_link(@case_study.headline, href: vertical_market_case_study_path(@vertical_market, @case_study))
    end
  end

end
