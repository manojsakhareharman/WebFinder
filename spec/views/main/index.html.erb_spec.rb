require 'rails_helper'

describe "main/index.html.erb" do
  before do
    @vertical_markets = FactoryGirl.create_list(:vertical_market, 3, parent_id: nil)
    assign(:vertical_markets, @vertical_markets)

    render
  end

  it "links to all top-level vertical markets" do
    @vertical_markets.each do |vm|
      expect(rendered).to have_link(vm.name, href: vertical_market_path(vm))
    end
  end
end
