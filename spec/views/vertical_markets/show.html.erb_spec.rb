require 'rails_helper'

describe "vertical_markets/show.html.erb" do
  context "parent vertical" do
    before do
      @vertical_market = FactoryGirl.create(:vertical_market, parent_id: nil)
      @child_verticals = FactoryGirl.create_list(:vertical_market, 3, parent_id: @vertical_market.id)
      @example = FactoryGirl.create(:example, vertical_market: @vertical_market)
      assign(:vertical_market, @vertical_market)

      render
    end

    it "links to child verticals" do
      @child_verticals.each do |vm|
        expect(rendered).to have_link(vm.name, href: vertical_market_path(vm))
      end
    end

    it "does not link to applications" do
      expect(rendered).not_to have_link(@example.name)
    end
  end

  context "bottom-level vertical" do
    before do
      @vertical_market = FactoryGirl.create(:vertical_market)
      @example = FactoryGirl.create(:example, vertical_market: @vertical_market)
      assign(:vertical_market, @vertical_market)

      render
    end

    # with javascript, the application content loads inline via AJAX
    # without, it links to a example view page
    it "links to related example applications" do
      expect(rendered).to have_link(@example.name, href: vertical_market_example_path(@vertical_market, @example))
    end

  end
end
