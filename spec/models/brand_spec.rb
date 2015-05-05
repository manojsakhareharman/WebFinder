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

  it "#for_consultant_portal loads brands which have their downloads page defined" do
    Brand.destroy_all
    brand2 = FactoryGirl.create(:brand, name: "ZZZZ", downloads_page_url: "foo.com")
    brand1 = FactoryGirl.create(:brand, name: "AAAAA", downloads_page_url: nil)

    brands = Brand.for_consultant_portal

    expect(brands).to include(brand2)
    expect(brands).not_to include(brand1)
  end

  it ".friendly_url formats the url without protocol" do
    @brand.update_column(:url, "http://somesite.com")
    @brand.reload

    expect(@brand.friendly_url).to eq("somesite.com")
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
