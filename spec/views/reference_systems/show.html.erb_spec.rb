require 'rails_helper'

RSpec.describe "reference_systems/show.html.erb", :type => :view do

  before do
    @vertical_market = FactoryGirl.create(:vertical_market)
    @reference_systems = FactoryGirl.create_list(:reference_system, 3, vertical_market: @vertical_market)
    @reference_system = @reference_systems.second
    assign(:reference_system, @reference_system)
    assign(:vertical_market, @vertical_market)

    render
  end

  context "general" do

    it "displays the reference_system name as a title" do
      expect(rendered).to have_css("h1", text: @reference_system.slider_name)
    end

    it "links back to the vertical market" do
      expect(rendered).to have_link(@vertical_market.name.downcase, href: vertical_market_path(@vertical_market))
    end

    it "links to previous and next reference_systems" do
      expect(rendered).to have_link("previous", href: vertical_market_reference_system_path(@vertical_market, @reference_systems.first))
      expect(rendered).to have_link("next", href: vertical_market_reference_system_path(@vertical_market, @reference_system.next))
    end

  end

  context "system-diagram" do

    it "displays reference_system headline and description paragraph" do
      expect(rendered).to have_content(@reference_system.description)
      expect(rendered).to have_css("h2", text: @reference_system.headline)
    end

    it "displays the system diagram" do
      expect(rendered).to have_xpath("//img[@src='/assets/#{@reference_system.system_diagram.url(:large)}']")
    end

  end

end
