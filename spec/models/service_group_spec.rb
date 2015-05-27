require 'rails_helper'

RSpec.describe ServiceGroup, type: :model do

  before :all do
    @service_group = FactoryGirl.create(:service_group)
  end

  subject { @service_group }
  it { should respond_to :brand }
  it { should respond_to :service_center_service_groups }
  it { should respond_to :service_centers }

  it "#names collects group names" do
    names = ServiceGroup.names

    expect(names).to be_an(Array)
    expect(names).to include(@service_group.name)
  end
end
