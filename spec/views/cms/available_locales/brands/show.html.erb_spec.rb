require "rails_helper"

RSpec.describe "cms/available_locales/brands/show.html.erb" do

  before :all do
    @locale = FactoryGirl.build_stubbed(:available_locale)
    @brand = FactoryGirl.build_stubbed(:brand)
  end

  before :each do
    assign(:brand, @brand)
    assign(:available_locale, @locale)
    render
  end

  it "should show brand stuffs" do
    expect(rendered).to have_content @brand.name
  end

  it "should show better brand stuffs" do
    skip "Make the brand page better after translating."
  end
end
