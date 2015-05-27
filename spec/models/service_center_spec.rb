require 'rails_helper'

RSpec.describe ServiceCenter, type: :model do

  before :all do
    @service_center = FactoryGirl.create(:service_center, active: true)
  end

  subject { @service_center }
  it { should respond_to :contact_name }
  it { should respond_to :name }
  it { should respond_to :email }
  it { should respond_to :zip }
  it { should respond_to :willingness }
  it { should respond_to :active? }
  it { should respond_to :service_center_service_groups }
  it { should respond_to :service_groups }

  it ".active should select only active service centers" do
    inactive_service_center = FactoryGirl.create(:service_center, active: false)

    results = ServiceCenter.active

    expect(results).to include(@service_center)
    expect(results).not_to include(inactive_service_center)
  end

end
