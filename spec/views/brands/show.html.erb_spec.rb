require "rails_helper"

RSpec.describe "brands/show.html.erb", as: :view do

  before(:all) do
    @brand = FactoryGirl.create(:brand, description: "Super cool maker of widgets")
    assign(:brand, @brand)
  end

  before :each do
    render
  end

  it "shows the brand logo" do
    expect(rendered).to have_css("img[@src='#{@brand.logo.url(:small)}'][@alt='#{@brand.name}']")
  end

  it "links to the brand external site" do
    expect(rendered).to have_link(@brand.url, href: @brand.url)
  end

  it "has the brand description" do
    expect(rendered).to have_content @brand.description
  end

end
