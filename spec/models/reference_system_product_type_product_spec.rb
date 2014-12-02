require 'rails_helper'

RSpec.describe ReferenceSystemProductTypeProduct, :type => :model do
  before do
    @rsptp = FactoryGirl.create(:reference_system_product_type_product)
  end

  subject { @rsptp }
  it { should respond_to(:reference_system_product_type) }
  it { should respond_to(:product) }

end