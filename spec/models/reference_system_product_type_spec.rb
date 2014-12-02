require 'rails_helper'

RSpec.describe ReferenceSystemProductType, :type => :model do

  before do
    @reference_system_product_type = FactoryGirl.create(:reference_system_product_type)
  end

  subject { @reference_system_product_type }
  it { should respond_to(:reference_system) }
  it { should respond_to(:product_type) }
  it { should respond_to(:quantity) }

  context "products" do
    it { should respond_to(:reference_system_product_type_products) }
    it { should respond_to(:products) }
  end
end
