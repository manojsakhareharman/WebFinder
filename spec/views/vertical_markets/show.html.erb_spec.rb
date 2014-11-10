require 'rails_helper'

describe "vertical_markets/show.html.erb" do
  context "parent vertical" do
    before do
      @vertical_market = FactoryGirl.create(:vertical_market, parent_id: nil)
      @child_verticals = FactoryGirl.create_list(:vertical_market, 3, parent_id: @vertical_market.id)
      assign(:vertical_market, @vertical_market)

      render
    end

    it "links to child verticals" do
      @child_verticals.each do |vm|
        expect(rendered).to have_link(vm.name, href: vertical_market_path(vm))
      end
    end
  end
end
