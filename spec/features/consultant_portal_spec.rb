require "rails_helper"

feature "Consultant portal" do

  before :all do
    @brand = FactoryGirl.create(:brand, downloads_page_url: "http://brand.download.page")
  end

  scenario "landing page links to brand download page" do
    visit consultant_portal_path

    expect(page).to have_link(@brand.name, href: @brand.downloads_page_url)
  end
end
