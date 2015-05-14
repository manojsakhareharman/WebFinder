require "rails_helper"

RSpec.describe "service_centers/login.html.erb", as: :view do

  before :all do
    @brand = FactoryGirl.create(:brand, name: "Multiple Word Brand", tech_url: "http://tech.foo.com")
  end

  before :each do
    assign(:brands, [@brand])
    render
  end

  it "links to the brands' tech site" do
    expect(rendered).to have_link "Multiple Technical Resources", href: @brand.tech_url
  end

  it "links to the brands' website" do
    expect(rendered).to have_link "Multiple Website", href: @brand.url
  end

  it "links to becoming a service center" do
    expect(rendered).to have_css "h3", text: "Become a Service Center"
    expect(rendered).to have_link "Apply Now", href: new_service_center_path
  end
end
