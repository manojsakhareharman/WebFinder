require 'rails_helper'

RSpec.describe "admin/vertical_markets.rb" do

  let(:resource_class) { VerticalMarket }
  let(:all_resources) { ActiveAdmin.application.namespaces[:admin].resources }
  let(:resource) { all_resources[resource_class] }

  it "should register vertical markets" do
    expect(resource.resource_name).to eq("VerticalMarket")
  end

  it "should have filters" do
    expect(resource.filters).to include(:parent)
    expect(resource.filters).to include(:name)
    expect(resource.filters).to include(:updated_at)
  end

end
