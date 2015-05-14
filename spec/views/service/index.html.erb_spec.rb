require "rails_helper"

RSpec.describe "service/index.html.erb", as: :view do

  before do
    render
  end

  it "has end-user registration section" do
    expect(rendered).to have_css "h5", text: "Register Your Products"
    expect(rendered).to have_link "Register Now", href: ENV['warranty_registration_url']
  end

  it "has warranty repair links" do
    expect(rendered).to have_css "h5", text: "Warranty Repair"
    expect(rendered).to have_link "Start Your Repair", href: ENV['warranty_repair_url']
    expect(rendered).to have_css "h5", text: "Out of Warranty?"
    expect(rendered).to have_link "Get Started", href: ENV['warranty_repair_url']
  end

  it "has service center login section" do
    expect(rendered).to have_css "h3", text: "Service Center Login"
    expect(rendered).to have_link "Access Now", href: service_center_login_path
  end

  it "has section on becoming a service center" do
    expect(rendered).to have_css "h3", text: "Become a Service Center"
    expect(rendered).to have_link "Apply Now", href: new_service_center_path
  end

  it "has dealer portal section" do
    expect(rendered).to have_css "h3", text: "Dealer Portal"
    expect(rendered).to have_link "Order Now", href: ENV['dealer_portal_url']
  end
end
