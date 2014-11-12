require 'rails_helper'

RSpec.describe "examples/show.html.erb", :type => :view do

  before do
    @vertical_market = FactoryGirl.create(:vertical_market)
    @examples = FactoryGirl.create_list(:example, 3, vertical_market: @vertical_market)
    @example = @examples.second
    assign(:example, @example)
    assign(:vertical_market, @vertical_market)
  end

  context "general" do

    it "displays the example name as a title" do
      render

      expect(rendered).to have_css("h1", text: @example.name)
    end

    it "links back to the vertical market" do
      render

      expect(rendered).to have_link(@vertical_market.name, href: vertical_market_path(@vertical_market))
    end

    it "links to previous and next examples" do
      render

      expect(rendered).to have_link("previous", href: vertical_market_example_path(@vertical_market, @examples.first))
      expect(rendered).to have_link("next", href: vertical_market_example_path(@vertical_market, @example.next))
    end

    it "displays related resource guide"

    it "displays example description paragraph" do
      @example.update_column(:description, "This system can save the world...")

      render

      expect(rendered).to have_css("div.example_description", text: @example.description)
    end

  end

  context "non-retail" do
    before do
      @example.update_column(:retail, false)
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
      @example.update_column(:retail, true)
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
