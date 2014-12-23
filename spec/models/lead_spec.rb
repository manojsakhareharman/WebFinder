require 'rails_helper'

RSpec.describe Lead, :type => :model do
  before do
    @lead = FactoryGirl.build_stubbed(:lead)
  end

  subject { @lead }
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:company) }
  it { should respond_to(:phone) }
  it { should respond_to(:project_description) }
  it { should respond_to(:source) }

  describe "push to external system" do
    it "sends to sales contact database" do
      skip "Determine how to integrate with which external contact system"
    end
  end
end
