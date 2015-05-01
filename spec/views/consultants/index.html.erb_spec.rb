require "rails_helper"

RSpec.describe "consultants/index.html.erb", as: :view do

  before :all do
    @brand = FactoryGirl.create(:brand, downloads_page_url: "foo.com")
    assign(:brands, [@brand])
  end

  before :each do
    render
  end

  it "links to the brand's external downloads page" do
    expect(rendered).to have_link "#{@brand.name} Technical Downloads", href: @brand.downloads_page_url
  end
end
