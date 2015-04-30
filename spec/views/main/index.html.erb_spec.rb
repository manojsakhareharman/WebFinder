require 'rails_helper'

RSpec.describe "main/index.html.erb", as: :view do
  before(:all) do
    @brands = FactoryGirl.create_list(:brand, 3)
    @vertical_markets = FactoryGirl.create_list(:vertical_market, 3, parent_id: nil)
    assign(:vertical_markets, @vertical_markets)
  end

  before :each do
    allow(view).to receive(:all_brands).and_return(@brands)

    render
  end

  it "links to all top-level vertical markets" do
    @vertical_markets.each do |vm|
      expect(rendered).to have_link(vm.name, href: vertical_market_path(vm))
    end
  end

  it "links to each brand" do
    @brands.each do |brand|
      expect(rendered).to have_link(brand.name, href: brand_path(brand))
    end
  end

  it "shows logos for each brand" do
    @brands.each do |brand|
      expect(rendered).to have_css("img[@src='#{brand.white_logo.url(:circle)}']")
    end
  end

end
