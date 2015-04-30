require 'rails_helper'

RSpec.describe Brand, :type => :model do
  before :all do
    @brand = FactoryGirl.create(:brand)
  end

  subject { @brand }
  it { should respond_to(:name) }
  it { should respond_to(:url) }
  it { should respond_to(:logo) }
  it { should respond_to(:white_logo) }
  it { should respond_to(:friendly_id) }

  it "#all_for_site loads all brands in alphabetical order" do
    Brand.destroy_all
    brand2 = FactoryGirl.create(:brand, name: "ZZZZ")
    brand1 = FactoryGirl.create(:brand, name: "AAAAA")

    all = Brand.all_for_site

    expect(all.first).to eq(brand1)
    expect(all.last).to eq(brand2)
  end

  describe "friendly id" do
    it "generates a new slug when name changes" do
      old_slug = @brand.slug

      @brand.name = "Yo Mama #{@brand.name}"
      @brand.save
      @brand.reload

      expect(@brand.slug).not_to eq old_slug
      expect(@brand.slug.present?).to be(true)
    end
  end

end
