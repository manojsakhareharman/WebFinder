require 'rails_helper'

RSpec.describe Brand, :type => :model do
  before :each do
    @brand = FactoryGirl.build(:brand)
  end

  subject { @brand }
  it { should respond_to(:name) }
  it { should respond_to(:url) }
  it { should respond_to(:logo) }
  it { should respond_to(:white_logo) }
  it { should respond_to(:friendly_id) }
  it { should respond_to(:downloads_page_url) }
  it { should respond_to(:support_url) }
  it { should respond_to(:training_url) }

  it "#all_for_site loads all brands in alphabetical order except service-only brands" do
    brand1 = FactoryGirl.create(:brand, name: "ZZZZ")
    brand2 = FactoryGirl.create(:brand, name: "AAAAA")
    brand3 = FactoryGirl.create(:brand, show_on_main_site: false)

    all = Brand.all_for_site

    expect(all.first).to eq(brand2)
    expect(all.last).to eq(brand1)
    expect(all).not_to include(brand3)
  end

  it "#for_consultant_portal loads brands which have their downloads page defined" do
    Brand.delete_all
    brand1 = FactoryGirl.create(:brand, name: "ZZZZ", downloads_page_url: nil)
    brand2 = FactoryGirl.create(:brand, name: "AAAAA", downloads_page_url: "http://foo.com")
    brand3 = FactoryGirl.create(:brand, show_on_main_site: false, downloads_page_url: "http://zoo.com")

    brands = Brand.for_consultant_portal

    expect(brands).to include(brand2)
    expect(brands).not_to include(brand1)
    expect(brands).not_to include(brand3)
  end

  it "#for_service_site loads only brands relevant for service site" do
    Brand.delete_all
    brand1 = FactoryGirl.create(:brand, name: "ZZZZ")
    brand2 = FactoryGirl.create(:brand, name: "AAAAA")
    brand3 = FactoryGirl.create(:brand, show_on_services_site: false)

    brands = Brand.for_service_site

    expect(brands.first).to eq(brand2)
    expect(brands.last).to eq(brand1)
    expect(brands).not_to include(brand3)
  end

  it "should require the name" do
    @brand.name = nil

    expect(@brand.valid?).to be false
  end

  it "#first_name should return just the first word in the name" do
    @brand.name = "One Two Three"

    expect(@brand.first_name).to eq "One"
  end

  it "should not allow invalid URLs" do
    @brand.url = "a non-valid url"

    expect(@brand.valid?).to be(false)
  end

  it ".friendly_url formats the url without protocol" do
    @brand.url = "http://somesite.com"
    @brand.save

    expect(@brand.friendly_url).to eq("somesite.com")
  end

  it "should not allow invalid support_url" do
    @brand.support_url = "not a url"

    expect(@brand.valid?).to be(false)
  end

  it "should not allow invalid downloads_page_url" do
    @brand.downloads_page_url = "not a url"

    expect(@brand.valid?).to be(false)
  end

  it "should not allow invalid training_url" do
    @brand.training_url = "not a url"

    expect(@brand.valid?).to be(false)
  end

  it "should allow a blank tech_url" do
    @brand.tech_url = nil

    expect(@brand.valid?).to be true
  end

  it "should not allow an invalid tech_url" do
    @brand.tech_url = "something invalid"

    expect(@brand.valid?).to be false
  end

  describe "friendly id" do
    it "generates a new slug when name changes" do
      @brand.save
      old_slug = @brand.slug

      @brand.name = "Yo Mama #{@brand.name}"
      @brand.save!
      @brand.reload

      expect(@brand.slug).not_to eq old_slug
      expect(@brand.slug.present?).to be(true)
    end
  end

end
