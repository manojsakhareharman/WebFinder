require 'rails_helper'

RSpec.describe VerticalMarket, :type => :model do

  before do
    @vertical_market = FactoryGirl.create(:vertical_market, parent_id: nil)
    @child_vertical = FactoryGirl.create(:vertical_market, parent_id: @vertical_market.id)
  end

  context "class methods" do
    it "#parent_verticals should return all the parent verticals" do
      parents = VerticalMarket.parent_verticals

      expect(parents).to include(@vertical_market)
      expect(parents).not_to include(@child_vertical)
    end
  end

  context "instance methods" do
    it "has a parent" do
      expect(@child_vertical.parent).to eq(@vertical_market)
    end

    it "has children" do
      expect(@vertical_market.children).to include(@child_vertical)
    end

    it "has examples" do
      example = FactoryGirl.create(:example, vertical_market: @child_vertical)

      @child_vertical.reload

      expect(@child_vertical.examples).to include(example)
    end
  end
end
