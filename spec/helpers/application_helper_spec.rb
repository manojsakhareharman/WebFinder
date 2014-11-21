require 'rails_helper'

RSpec.describe ApplicationHelper do

  describe "#top_vertical_market_navigation" do
    before do
      @vertical_markets = FactoryGirl.create_list(:vertical_market, 3)
    end

    it "links to each top-level vertical market" do
      nav = helper.top_vertical_market_navigation

      @vertical_markets.each do |vm|
        expect(nav).to have_link(vm.name, vertical_market_path(vm))
      end
    end
  end
end
