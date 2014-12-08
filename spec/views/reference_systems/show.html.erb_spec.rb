require 'rails_helper'

RSpec.describe "reference_systems/show.html.erb", :type => :view do

  before do
    @vertical_market = FactoryGirl.create(:vertical_market)
    @reference_systems = FactoryGirl.create_list(:reference_system, 3, vertical_market: @vertical_market)
    @reference_system = @reference_systems.second
    assign(:reference_system, @reference_system)
    assign(:vertical_market, @vertical_market)
  end

  context "general" do

    it "displays the reference_system name as a title" do
      render

      expect(rendered).to have_css("h1", text: @reference_system.name)
    end

    it "links back to the vertical market" do
      render

      expect(rendered).to have_link(@vertical_market.name.downcase, href: vertical_market_path(@vertical_market))
    end

    it "links to previous and next reference_systems" do
      render

      expect(rendered).to have_link("previous", href: vertical_market_reference_system_path(@vertical_market, @reference_systems.first))
      expect(rendered).to have_link("next", href: vertical_market_reference_system_path(@vertical_market, @reference_system.next))
    end

  end

end
