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

      expect(rendered).to have_link(@vertical_market.name, href: vertical_market_path(@vertical_market))
    end

    it "links to previous and next reference_systems" do
      render

      expect(rendered).to have_link("previous", href: vertical_market_reference_system_path(@vertical_market, @reference_systems.first))
      expect(rendered).to have_link("next", href: vertical_market_reference_system_path(@vertical_market, @reference_system.next))
    end

    it "displays related resource guide"

    it "displays reference_system description paragraph" do
      @reference_system.update_column(:description, "This system can save the world...")

      render

      expect(rendered).to have_css("div.reference_system_description", text: @reference_system.description)
    end

    it "displays the headline" do
      render

      expect(rendered).to have_css("h2", text: @reference_system.headline)
    end

  end

  context "non-retail" do
    before do
      @reference_system.update_column(:retail, false)
      render
    end

    it "links to ecommerce store" do
      expect(rendered).not_to have_css("div.buynow_container")
    end

    it "displays the design/build infographics" do
      expect(rendered).to have_css("div.infographic_container")
    end

    it "displays the leadgen form"
  end

  context "retail" do
    before do
      @reference_system.update_column(:retail, true)
      render
    end

    it "links to ecommerce store" do
      expect(rendered).to have_css("div.buynow_container")
    end

    it "does not display the design/build infographic" do
      expect(rendered).not_to have_css("div.infographic_container")
    end

    it "does not link to leadgen form"
  end
end
