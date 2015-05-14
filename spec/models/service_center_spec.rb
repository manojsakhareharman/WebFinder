require 'rails_helper'

RSpec.describe ServiceCenter, type: :model do

  before :all do
    @service_center = FactoryGirl.create(:service_center)
  end

  subject { @service_center }
  it { should respond_to :contact_name }
  it { should respond_to :name }
  it { should respond_to :email }
  it { should respond_to :zip }
  it { should respond_to :willingness }
  it { should respond_to :active? }

end
