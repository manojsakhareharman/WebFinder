require "rails_helper"

RSpec.describe "cms/available_locales/landing_pages/index.html.erb" do

  before :all do
    @landing_page = FactoryGirl.create(:landing_page)
    @locale = FactoryGirl.create(:available_locale)
  end

  before :each do
    assign(:available_locale, @locale)
    assign(:landing_pages, LandingPage.all)
    render
  end

  it "links to edit the landing page" do
    expect(rendered).to have_link(@landing_page.title, href: edit_cms_available_locale_landing_page_path(@locale, @landing_page))
  end
end
