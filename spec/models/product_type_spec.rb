require 'rails_helper'

RSpec.describe ProductType, :type => :model do

  before :all do
    @product_type = FactoryGirl.create(:product_type)
  end

  subject { @product_type }
  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:friendly_id) }

  describe "friendly id" do
    it "generates a new slug when name changes" do
      old_slug = @product_type.slug

      @product_type.name = "Yo Mama #{@product_type.name}"
      @product_type.save
      @product_type.reload

      expect(@product_type.slug).not_to eq old_slug
      expect(@product_type.slug.present?).to be(true)
    end
  end

end
