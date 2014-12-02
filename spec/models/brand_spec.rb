require 'rails_helper'

RSpec.describe Brand, :type => :model do
  before do
    @brand = FactoryGirl.create(:brand)
  end

  subject { @brand }
  it { should respond_to(:name) }
  it { should respond_to(:url) }
end
