require "rails_helper"

RSpec.describe "layouts/application.html.erb", as: :view do

  before :all do
    @brand = FactoryGirl.create(:brand)
    @vertical_market = FactoryGirl.create(:vertical_market, parent_id: nil)
    @child_vertical = FactoryGirl.create(:vertical_market, parent_id: @vertical_market.id)
  end

  before :each do
    allow(view).to receive(:all_brands).and_return([@brand])

    render
  end

  describe "header" do
    it "has logo in top nav" do
      expect(header).to have_css("img[@src='/assets/harman-logo-white.png']")
    end

    it "links to consultant portal" do
      expect(header).to have_link "Consultants", href: consultant_portal_path
    end

    it "links to training page" do
      expect(header).to have_link "Training", href: training_path
    end

    it "links to the contacts page" do
      expect(header).to have_link "Contacts", href: contacts_path
    end

    it "links to top-level vertical markets" do
      expect(header).to have_link @vertical_market.name, href: vertical_market_path(@vertical_market)
    end

    it "doesn't link to child vertical markets" do
      expect(header).not_to have_link @child_vertical.name
    end

    it "links to service page" do
      expect(header).to have_link "Service", href: service_path
    end
  end

  describe "footer" do
    it "links to brands" do
      expect(rendered).to have_link(@brand.name, href: brand_path(@brand))
    end
  end

  def header
    @header ||= Capybara.string(rendered).find("nav.top-bar")
  end

end
