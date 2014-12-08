require 'rails_helper'

RSpec.describe "vertical_markets/_bottom.html.erb", :type => :view do

  before do
    @vertical_market = FactoryGirl.create(:vertical_market)
    @reference_system = FactoryGirl.create(:reference_system, vertical_market: @vertical_market)
  end

  it "links to case studies"

  context "non-retail" do
    before do
      @reference_system.update_column(:retail, false)
      render partial: "vertical_markets/bottom", locals: { vertical_market: @vertical_market }
    end

    it "links to ecommerce store" do
      skip "Ecommerce hook"
      expect(rendered).not_to have_css("div.buynow_container")
    end

    it "links to HEF"
    it "offers help finding contractor"

  end

  context "retail" do
    before do
      @reference_system.update_column(:retail, true)
      render partial: "vertical_markets/bottom", locals: { vertical_market: @vertical_market }
    end

    it "links to ecommerce store" do
      skip "Ecommerce hook"
      expect(rendered).to have_css("div.buynow_container")
    end
  end

end
