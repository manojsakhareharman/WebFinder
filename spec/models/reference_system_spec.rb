require 'rails_helper'

RSpec.describe ReferenceSystem, :type => :model do
  before do
    @vertical_market = FactoryGirl.create(:vertical_market)
    @reference_systems = FactoryGirl.create_list(:reference_system, 3, vertical_market: @vertical_market)
    @reference_system = @reference_systems.second
  end

  subject { @reference_system }
  it { should respond_to(:retail?) }
  it { should respond_to(:vertical_market) }
  it { should respond_to(:headline) }
  it { should respond_to(:description) }
  it { should respond_to(:venue_size_descriptor) }
  it { should respond_to(:banner) }
  it { should respond_to(:system_diagram) }

  context "as part of a list" do
    it "should have a previous reference_system" do
      expect(@reference_system.previous).to eq(@reference_systems.first)
    end
    it "should have a next reference_system" do
      expect(@reference_system.next).to eq(@reference_systems.last)
    end
  end

  context "with products" do
    before do
      @reference_system.update_column(:retail, true)
    end

    it { should respond_to(:reference_system_product_types) }
  end
end
