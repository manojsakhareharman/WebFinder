require "rails_helper"

feature "Consultant portal" do

  before :all do
    @brand = FactoryGirl.create(:brand, downloads_page_url: "http://brand.download.page")
    @other_brand = FactoryGirl.create(:brand, downloads_page_url: nil)
  end

  scenario "landing page links to brand download page" do
    visit consultant_portal_path

    main_container = page.find(".main-container")
    expect(main_container).to have_link(@brand.name, href: @brand.downloads_page_url)
    expect(main_container).not_to have_link(@other_brand.name)
  end
end
