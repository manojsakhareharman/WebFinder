require 'rails_helper'

RSpec.describe ProductType, :type => :model do

  before do
    @product_type = FactoryGirl.create(:product_type)
  end

  subject { @product_type }
  it { should respond_to(:name) }
  it { should respond_to(:description) }
end
