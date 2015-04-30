require 'rails_helper'

RSpec.describe "vertical_markets/_buy.html.erb", :type => :view do

  before :all do
    @vertical_market = FactoryGirl.create(:vertical_market)
    @reference_system = FactoryGirl.create(:reference_system, vertical_market: @vertical_market)
  end

  context "non-retail" do
    before do
      @reference_system.update_column(:retail, false)
      render partial: "vertical_markets/buy", locals: { vertical_market: @vertical_market }
    end

    it "should use infographic as 'buy' section" do
      skip "Finalize infogrpahic"
    end

  end

  context "retail" do
    before do
      @reference_system.update_column(:retail, true)
      render partial: "vertical_markets/buy", locals: { vertical_market: @vertical_market }
    end

    it "links to ecommerce store" do
      skip "Develop Ecommerce section for retail vertical markets"
    end
  end

end
