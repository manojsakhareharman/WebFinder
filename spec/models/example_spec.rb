require 'rails_helper'

RSpec.describe Example, :type => :model do

  before do
    @vertical_market = FactoryGirl.create(:vertical_market)
    @examples = FactoryGirl.create_list(:example, 3, vertical_market: @vertical_market)
    @example = @examples.second
  end

  subject { @example }
  it { should respond_to(:retail?) }
  it { should respond_to(:vertical_market) }

  context "as part of a list" do
    it "should have a previous example" do
      expect(@example.previous).to eq(@examples.first)
    end
    it "should have a next example" do
      expect(@example.next).to eq(@examples.last)
    end
  end

end

