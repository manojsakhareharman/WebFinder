require 'rails_helper'

RSpec.describe Product, :type => :model do
  before do
    @product = FactoryGirl.create(:product)
  end

  subject { @product }
  it { should respond_to(:name) }
  it { should respond_to(:brand) }
  it { should respond_to(:photo) }
  it { should respond_to(:url) }
  it { should respond_to(:description) }
end
